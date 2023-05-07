#!/bin/bash

set -e

for number in {1..5}
do
    VERSION=$(date +"%m%d%y-%H%M%S")
    DATE=$(date)
    FILE_NAME=app-${VERSION}-${number}.log
    touch $FILE_NAME
    echo "File created on ${DATE}" > $FILE_NAME
done
