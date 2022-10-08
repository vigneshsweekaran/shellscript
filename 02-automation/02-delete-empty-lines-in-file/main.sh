#!/bin/bash

# Removing empty lines using sed (not including lines with spaces)
echo -e "\nRemoving empty lines using sed (not including lines with spaces)"
sed "/^$/d" sample.txt

# Removing empty lines using sed (including lines with spaces)
echo -e "\n###### Removing empty lines using sed (including lines with spaces) ######"
sed "/^ *$/d" sample.txt

# Remove blank lines using grep (not including lines with spaces).
echo -e "\n###### Remove blank lines (not including lines with spaces). ######"
grep . sample.txt

# Remove completely blank lines using grep (including lines with spaces).
echo -e "\n###### Remove blank lines (not including lines with spaces). ######"
grep "\S" sample.txt

# Remove completely blank lines using awk
echo -e "\n###### Remove completely blank lines using awk ######"
awk 'NF' sample.txt