#!/bin/bash

echo
echo Please select one of the options below
echo
echo 'a = Display Date and Time'
echo 'b = List file and Directories'
echo 'c = List users logged in'
echo 'd = check system uptime'
echo
read choices
case $choices in
    a) date;;
    b) ls;;
    c) whoami;;
    d) uptime;;
    *) echo Invalid choice - Bye
esac
