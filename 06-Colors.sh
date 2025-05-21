#!/bin/bash

SERVICE=$1

#Check whether the service is already installed or not

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is \e[32m not installed.. calling INSTALL function \e[0m"
        INSTALL $2
    else
        echo -e "\e[31m $2 is already installed \e[0m"
    fi
}


INSTALL(){ 

    dnf install $1 -y
    if [ $? -eq 0 ]
    then
        echo -e "\e[32m $1 successfully installed"
    else
        echo -e "\e[31m $1 is failed"
        exit 1
    fi
}

dnf list installed $SERVICE
VALIDATE $? $SERVICE