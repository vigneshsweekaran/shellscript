#!/bin/bash

# Create a text file called /tmp/domains.txt as follows:

echo "cyberciti.biz|202.54.1.1$|home/httpd|ftpcbzuser" > /tmp/domains.txt
echo "nixcraft.com|202.54.1.2|/home/httpd|ftpnixuser" >> /tmp/domains.txt

# setupapachevhost.sh - Apache webhosting automation demo script
file=/tmp/domains.txt

# set the Internal Field Separator to |
IFS='|'
while read -r domain ip webroot ftpusername
do
        printf "*** Adding %s to httpd.conf...\n" $domain
        printf "Setting virtual host using %s ip...\n" $ip
        printf "DocumentRoot is set to %s\n" $webroot
        printf "Adding ftp access for %s using %s ftp account...\n\n" $domain $ftpusername

done < "$file"
