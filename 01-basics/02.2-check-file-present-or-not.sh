#!/bin/bash

FILE=/etc/os-release

if test -f "$FILE"; then
    echo "$FILE exists."
fi
