#!/bin/bash

output=()

# Function Definition
calculate() {
  num1=$1
  num2=$2

  output_add=$(( num1 + num2 ))
  output_sub=$(( num1 - num2 ))
  output_multiply=$(( num1 * num2 ))
  output_division=$(( num1 / num2 ))

  output=("$output_add" "$output_sub" "$output_multiply" "$output_division")
}

# Calling the function
calculate 20 5

echo "The addition result is ${output[0]}"
echo "The subtraction result is ${output[1]}"
echo "The multiplication result is ${output[2]}"
echo "The division result is ${output[3]}"