#!/bin/bash

set -e

PATH="/tmp/files"
FILE_EXTENSION=".log"
TARGET_FILE_SIZE="1K" #Eg: 10K, 100M, 1GB

find ${PATH} -type f -name "*${FILE_EXTENSION}" -size +${TARGET_FILE_SIZE} -delete