# #!/bin/bash

# source ./common.sh

# check_root

# echo "Please enter DB password:"
# read -s mysql_root_password

# dnf install mysql-server -y &>>$LOGFILE

# systemctl enable mysqld &>>$LOGFILE

# systemctl start mysqld &>>$LOGFILE

# #mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
# #VALIDATE $? "Setting up root password"

# #Below code will be useful for idempotent nature
# mysql -h 172.31.22.201 -uroot -p${mysql_root_password} -e 'show databases;' &>>$LOGFILE
# if [ $? -ne 0 ]
# then
#     mysql_secure_installation --set-root-pass ${mysql_root_password} &>>$LOGFILE
    
# else
#     echo -e "MySQL Root password is already setup...$Y SKIPPING $N"
# fi

#!/bin/bash

source ./common.sh

check_root

echo "Please enter DB password:"
read -s mysql_root_password

dnf install mysql-server -y &>>$LOGFILE

systemctl enable mysqld &>>$LOGFILE

systemctl start mysqld &>>$LOGFILE

#Below code will be useful for idempotent nature
#mysql -h 172.31.22.201 -uroot -p${mysql_root_password} -e 'show databases;' &>>$LOGFILE
if [ $? -ne 0 ]
then
    mysql_secure_installation --set-root-pass ${mysql_root_password} &>>$LOGFILE
else
    echo -e "MySQL Root password is already setup...$Y SKIPPING $N"
fi

# This is for &>>$logfile for multiple times not to use
# sh 06-array.sh &> output.log --> It will take both failure or  success 

# Exit status is if previous command is success then it will become 0 otherwise it will become not 0