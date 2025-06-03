#!/bin/bash

PACKAGES=("mysql","python","nginx","httpd")

for package in {$PACKAGES[@]}
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "$package is not installed"
        dnf install $package -y
    else
        echo "Nothing to do $package"
    fi
done