#!/bin/sh

# Function Definition
addition() {
  num1=$1
  num2=$2

  output_add=$(( num1 + num2 ))
  output_sub=$(( num1 - num2 ))
  output_multiply=$(( num1 * num2 ))
  output_division=$(( num1 % num2 ))

  return ( $output_add $output_sub $output_multiply $output_division )
}

# Calling the function
addition 20 5

# Capture the result returnd by last command
result=$?

echo "The addition result is ${result[0]}"
echo "The addition result is ${result[1]}"
echo "The addition result is ${result[2]}"
echo "The addition result is ${result[3]}"