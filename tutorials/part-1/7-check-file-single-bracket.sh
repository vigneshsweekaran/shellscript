#!/bin/bash

# File path stored in variable FILE
FILE=/etc/os-release

# test command used to check whether file is present or not
if [ -f "$FILE" ]; then
    echo "$FILE exists."
fi
