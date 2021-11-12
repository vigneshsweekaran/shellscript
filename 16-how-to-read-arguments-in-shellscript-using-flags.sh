#!/bin/bash

# How to read arguments in shellscript using flags

while getopts u:a:f: flag
do
    case "${flag}" in
        u) username=${OPTARG};;
        a) age=${OPTARG};;
        f) fullname=${OPTARG};;
    esac
done
echo "Username: $username";
echo "Age: $age";
echo "Full Name: $fullname";

# --------------------------------
# Sample Input:
# ./16-how-to-read-arguments-in-shellscript-using-flags.sh -u vignesh -a 26 -f "Vignesh Sweekaran"
# --------------------------------

# --------------------------------
# Sample Output:
# Username: vignesh
# Age: 26
# Full Name: Vignesh Sweekaran
# --------------------------------