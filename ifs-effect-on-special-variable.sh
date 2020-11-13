#!/bin/bash
# ifsargs.sh - Cmd args - positional parameter demo
# ifs-effect-on-special-variable.sh honda yamaha bajaj suzuki hero

echo "Command-Line Arguments Demo"
echo "*** All args displayed using \$@ positional parameter ***"
echo $@
echo "*** All args displayed using \$* positional parameter ***"
echo $*
echo
echo -------------------------------------------------------------------
echo
# With double quotes for $@ and $*
# $@ expanded as "$1" "$2" "$3" ... "$n"
# $* expanded as "$1y$2y$3y...$n", where y is the value of IFS variable i.e. "$*" is one long string and $IFS act as an separator or token delimiters.

#### Set the IFS to | ####
IFS='|'

echo "Command-Line Arguments Demo"

echo "*** All args displayed using \$@ positional parameter ***"
echo "$@"        #*** double quote added ***#

echo "*** All args displayed using \$* positional parameter ***"
echo "$*"        #*** double quote added ***#
echo
echo -----------------------------------------------------------------------
echo

#### Set the IFS to | ####
IFS='-'

echo "Command-Line Arguments Demo"

echo "*** All args displayed using \$@ positional parameter ***"
echo "$@"        #*** double quote added ***#

echo "*** All args displayed using \$* positional parameter ***"
echo "$*"        #*** double quote added ***#



