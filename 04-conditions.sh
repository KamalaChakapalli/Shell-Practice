#!/bin/bash

#if condition flow

# $? - exit status of the last command will be stored.
# There are 0 to 127 exit status
#success exit status - 0
#failure exit status other than 0 (not equal to 0)

VAR1=$1
VAR2=$2

if [ $VAR1 > $VAR2 ]
then
    echo "$VAR1 is greater than $VAR2"
else
    echo "$VAR1 is lesser than $VAR2"
fi