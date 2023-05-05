#!/bin/bash

export DATA="I am the data"

# -z is used to check whether the length of STRING is zero
if [ -z "$DATA" ]; then
    echo "Environment variable DATA does not exist"
fi

if [ -z "$VALUE" ]; then
    echo "Environment variable VALUE does not exist"
fi

# -n is used to check whether the length of STRING is non-zero
if [ -n "$DATA" ]; then
    echo "The value for Environment variable DATA is : $DATA"
fi

