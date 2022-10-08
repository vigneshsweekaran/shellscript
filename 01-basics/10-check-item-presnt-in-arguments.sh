#!/bin/bash

# To print arguments passed , it is not an array
#echo $@

# To convert arguments to an array
#args=("$@")

# To print array
#echo ${args[@]}

#------------------------------------------------------------
# To get arguments as string
if [[ "$*" == *helm* ]]
then
    echo Found helm
fi
