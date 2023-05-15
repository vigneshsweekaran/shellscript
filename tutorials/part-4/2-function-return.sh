#!/bin/sh

# Function Definition
addition() {
  num1=$1
  num2=$2

  output=$(( num1 + num2 ))

  return $output
}

# Calling the function
addition 20 5

# Capture the result returnd by last command
result=$?

echo "The output is $result"