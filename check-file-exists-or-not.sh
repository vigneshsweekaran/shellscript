#!/bin/bash

if [ -e /etc/passwd ]
then
	echo "File exists"
else
	echo "File not found"
fi	
