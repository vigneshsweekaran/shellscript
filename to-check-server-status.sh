#!/bin/bash

ping -c1 8.8.8.8

if [ $? -eq 0 ]
then
    echo Ok
else
    echo Not Ok
fi
