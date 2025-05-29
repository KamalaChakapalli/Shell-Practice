#!/bin/bash

# To get current timstamp
TIMESTAMP=$(date)

#sum of two numbers
Number1=100
Number2=200

Sum=$(($Number1+$Number2))

echo "The sum of $Number1 and $Number2 : $Sum"

#To read PIN
read PIN1 #we can see pin value on screen

echo "Your number entered is : $PIN1"

read -s PIN2  #hides the pin while entering on screen

echo "Your number entered is : $PIN2"

#Arrays concept

MOVIES=("Court" "HIT3" "PUSHPA3" "Thandel")

echo "First Movie : ${MOVIES[0]}"

echo "Fifth Movie : ${MOVIES[4]}"  #there is no value is the position 4. It will print empty



#Installing MYSQL, PYTHON3 and NGINX 

