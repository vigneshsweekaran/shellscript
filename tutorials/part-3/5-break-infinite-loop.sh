#!/bin/bash

while [ true ] 
do
  systemctl status httpd > /dev/null
  httpd_status=$(echo $?)
  echo "The httpd status is ${httpd_status}"
  
  if [ $httpd_status -ne 0 ]
  then
    echo "Httpd application stopped !!"
    break
  fi

  sleep 1
done
