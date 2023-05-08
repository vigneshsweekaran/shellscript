#!/bin/bash

set -e

TARGET_PATH="/tmp/files"
FILE_EXTENSION=".gz"
TARGET_FILE_SIZE="1k" #Eg: 10K, 100M, 1GB

find ${TARGET_PATH} -type f -name "*${FILE_EXTENSION}" -size +${TARGET_FILE_SIZE} -delete