#!/bin/bash

set -e

TARGET_FOLDERS=("log_files" "error_files" "access_files")

for folder in ${TARGET_FOLDERS[@]}
do
    du -sh "/tmp/${folder}"
done
