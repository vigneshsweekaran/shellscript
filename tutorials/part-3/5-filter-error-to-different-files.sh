#!/bin/bash

FILE_NAME="/etc/os-release"

while read -r line; 
do 
  echo "$line";
done < $FILE_NAME
