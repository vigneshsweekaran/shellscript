#!/bin/bash

FILE=/etc/os-release

if [[ -f "$FILE" ]]; then
    echo "$FILE exists."
fi
