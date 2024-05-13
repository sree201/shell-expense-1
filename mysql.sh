#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[34m"


if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    exit 1
else
    echo "your are a super user"
fi

dnf install mysql-server -y &>>$LOGFILE
VALIDATE $? "Installing mysql server"

systemctl enable mysql &>>$LOGFILE
VALIDATE $? "Enabling mysql server"

systemctl start mysql &>>$LOGFILE
VALIDATE $? "Starting mysql server"

mysql_secure_installation --set-root-password ExpenseApp@1 &>>$LOGFILE
VALIDATE $? "Settting up root password"
