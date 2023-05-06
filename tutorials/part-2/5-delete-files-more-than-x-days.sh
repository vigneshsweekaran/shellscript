#!/bin/bash

PATH="/tmp"
TARGET_FOLDERS="log_files", "error_files", "access_files"
FILE_EXTENSIONS=(".log", ".txt")
TARGET_DAYS="10"

for folder in ${TARGET_FOLDERS[@]}
do
  for extension in ${FILE_EXTENSIONS[@]}
  do
    find ${PATH}/${folder} -type f -name "*${FILE_EXTENSION}" -mtime +${TARGET_DAYS} -delete
  done
done
