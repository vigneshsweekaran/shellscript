#!/bin/bash

count=1

while [ $count -le 5 ]
do
  echo "The count value is ${count}"
  count=$(( $count + 1 ))
done