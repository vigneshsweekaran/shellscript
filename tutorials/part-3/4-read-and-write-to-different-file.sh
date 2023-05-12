#!/bin/bash

SOURCE_FILE_NAME="/var/log/httpd/access_log"

TARGET_FOLDER=$(date +"%m%d%y-%H%M%S")

mkdir ${TARGET_FOLDER}

while read -r line; 
do
  if [[ "$line" == *Android* ]] || [[ "$line" == *android* ]]; then
    echo "$line" >> ${TARGET_FOLDER}/android.log
  elif [[ "$line" == *Windows* ]]; then
    echo "$line" >> ${TARGET_FOLDER}/windows.log
  else
    echo "$line" >> ${TARGET_FOLDER}/others.log
  fi
done < ${SOURCE_FILE_NAME}
