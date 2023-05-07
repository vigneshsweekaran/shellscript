#!/bin/bash

set -e

TARGET_PATH="/tmp"
TARGET_FOLDERS=("log_files" "error_files" "access_files")
FILE_EXTENSIONS=(".log" ".txt")
TARGET_TIME_IN_MINUTES="1"

for folder in ${TARGET_FOLDERS[@]}
do
  for extension in ${FILE_EXTENSIONS[@]}
  do
    echo "Deleting file extension ${extension} in folder ${folder}"
    find ${TARGET_PATH}/${folder} -type f -name "*${extension}" -mmin +${TARGET_TIME_IN_MINUTES} -delete
  done
done
