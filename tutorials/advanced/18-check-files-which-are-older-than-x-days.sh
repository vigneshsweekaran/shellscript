#!/bin/bash

echo "Files which are older than $1 days are identified and which will be filtered based on keyword - $2"

files=$(find /c/Users/User/test -type f -mtime +$1 -name "*$2*" | awk -F "/" '{print $NF}')

# echo "$files"

file_count=$(echo "$files" | wc -l)

# echo "${file_count}"

if [ $file_count -gt 5 ]
then
   echo -e "\nMany files name contains the phrase"
elif [ $file_count -gt 3 ]
then
   echo -e "\nSome files name contains the phrase"
elif [ $file_count -le 3 ]
then
   echo -e "\nFew files name contains the phrase"
fi