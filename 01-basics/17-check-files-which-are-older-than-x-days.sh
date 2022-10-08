#!/bin/bash

# Check files which are older than x days in current directory

echo "Printing files which are older than $1"

find /c/Users/User/learn -type f -mtime +$1

# --------------------------------
# Sample Input:
# ./17-check-files-which-are-older-than-x-days.sh 10
# --------------------------------

# --------------------------------
# Sample Output:
# Username: vignesh
# Age: 26
# Full Name: Vignesh Sweekaran
# --------------------------------