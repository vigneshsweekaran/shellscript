#!/bin/bash

count=1; 

while [ $count -lt 5 ]; do echo "The count value is ${count}"; count=$(( $count + 1 )); done
