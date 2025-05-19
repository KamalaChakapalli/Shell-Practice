#!/bin/bash

SERVICE=$1

#Check whether the service is already installed or not

dnf list installed $SERVICE
VALIDATE $? $SERVICE

VALIDATE(){
    if [ $? -ne 0]
    then
        echo "$SERVICE is not installed.. calling INSTALL function"
        INSTALL $SERVICE
    else
        echo "$SERVICE is already installed"
}


INSTALL(){

    dnf install $1 -y
    if [ $? -eq 0 ]
    then
        echo "$1 successfully installed"
    else
        echo "$1 is failed"
        exit 1
    fi
}