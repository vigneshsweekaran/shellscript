#!/bin/bash

set -eu -o pipefail

# Usage
# ./setup-glusterfs.sh install               --> Install glusterfs on the server

# variables
workers=(node1 node2)

# Install Glusterfs on Ubuntu
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:gluster/glusterfs-7
sudo apt-get update
sudo apt-get install -y glusterfs-server
sudo systemctl start glusterd
sudo systemctl enable glusterd
sudo mkdir -p /gluster/brick

for worker in workers
do
  sudo gluster peer probe ${worker}
done

sudo gluster pool list

sudo gluster volume create swarm-gfs replica 3 manager:/gluster/brick node1:/gluster/brick node2:/gluster/brick force

sudo gluster volume start swarm-gfs