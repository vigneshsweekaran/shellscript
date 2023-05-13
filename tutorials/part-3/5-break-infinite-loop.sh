#!/bin/bash

counter=0

while [ true ] 
do
  sleep 1
  if [ $counter -eq 10 ]
  then
    break
  fi

  counter=$(( $counter + 1 ))
done

