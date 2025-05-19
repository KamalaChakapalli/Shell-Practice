#!/bin/bash

SERVICE=$1

#Check whether the service is already installed or not

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is not installed.. calling INSTALL function"
        INSTALL $2
    else
        echo "$2 is already installed"
    fi
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

dnf list installed $SERVICE
VALIDATE $? $SERVICE