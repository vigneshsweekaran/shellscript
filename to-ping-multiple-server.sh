#!/bin/bash

#create a file and store all the Ip in it /home/ec2-user/hosts

echo "8.8.8.8" > /tmp/hosts
echo "8.8.8.8" >> /tmp/hosts

if [ -f /tmp/hosts ]
then
    printf "File Found \n" 
    for ip in $(cat /tmp/hosts)
    do
        ping -c1 $ip
    done
else
    printf "file not found"
fi

# Deleting the created file
rm /tmp/hosts
