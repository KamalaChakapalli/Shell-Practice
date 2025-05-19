#!/bin/bash

#Special variable in shell

# $@    - gives all variables passed as arguments to the script
# $#    - gives the number of variables passed to the script
# $0    - gives the name of the script
# $PWD  - gives the present working directory
# $USER - gives the name of the user who is running the script
# $HOME - gives the home of the user who is running the script
# $$    - gives the PID (Process Instant ID) of the current script
# $!    - gives the PID of the last command running in the background 
#(use & at last of the command to run in background)

VAR1=$1
VAR2=$2
VAR3=$3

echo "The arguments passed to the script: $@"

echo "The total number of arguments passed to the script: $#"

echo "The name of the script: $0"

echo "The present working directory: $PWD"

echo "The name of the user running the current script: $USER"

echo "The home directory of the user running the current script: $HOME"

echo "The PID of the script: $$"

sleep 20 &  #command to run in the background

echo "The PID of the last command running in the background: $!"

echo "The first argument passed: $VAR1"

echo "The second argument passed: $VAR2"

echo "The third argument passed: $VAR3"

