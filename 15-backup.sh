#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #If argument is passed for DAYS then it will take as $3 otherwise it will take default 14 days

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SOURCE_DIR=/home/ec2-user/app-logs
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/backup.log"
SCRIPT_DIR=$PWD

USAGE()
{
    echo -e "$R USAGE:: $N sh 15-backup.sh <source-dir> <destination-dir> <days(optional)>"
    exit 1
}

#validate functions takes the exit status of previous command as input

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "$2 is ... $G SUCCESS $N" | tee -a $LOG_FILE
    else
        echo -e "$2 is ... $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    fi
}

CHECK_ROOT()
{
    if [ $USERID -ne 0 ]
    then
        echo -e "$R ERROR:: Please run this script with root access $N"
        exit 1 #you can give any value upto 127 other than 0
    else
        echo "You are running with root access"
    fi
}

CHECK_ROOT
mkdir -p $LOGS_FOLDER
echo "Script started executing at:$(date)" | tee -a $LOG_FILE

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$R Source directory $SOURCE_DIR does not exist. Please check $N"
    exit 1
fi

if [ ! -d $DEST_DIR ]
then
    echo -e "$R Destination directory $DEST_DIR does not exist. Please check $N"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

if [ ! -z $FILES ]
then
    echo "Files to zip are: $FILES"
    TIMESTAMP=$(date +%F-%H-%M-%S)
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ $ZIP_FILE

    if [ -f $ZIP_FILE ]
    then
        echo -e "$G Successfully created zip file $N"
        while IFS=read -r filepath
        do
            echo "Deleting file: $filepath" | tee -a $LOG_FILE
            rm -rf $filepath
        done <<< $FILES_TO_DELETE

        echo -e "Log files older than $DAYS are deleted from the source directory.. $G SUCCESS $N"

    else
        echo -e "Zip file creation.. $R FAILURE $N "
        exit 1
    fi
else
    echo -e "No log files found older than 14 days.. $Y SKIPPING $N"
fi

echo "Script executed succesfully"