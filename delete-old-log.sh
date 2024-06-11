
#backup_dir="/tmp/backup-app.log"

source_dir="/tmp/app.log"

#tar -czf "$backup_dir/backup_$(date +%Y%m%d_%H%M%S).tar.gz" "$source_dir"


if [ -d $source_dir ]
then
    echo -e "$G Source Directory exists $N"
else
    echo -e "$R Please make sure $source_dir exists $N"
    exit 1
fi

FILES=$(find $source_dir -name "*.log" -mtime +14)

echo "files to delte:  $FILES"


while IFS= read -r line
do 
    echo "Deleting file: $line"
    rm -rf $line
done  <<< $FILES

#IFS --> Internal field seperator

# Create back date file using below command 
# touch -d 20240325 script.log

# To find the exact file use below command
# find. -name "*.log" -mtime +14 --> 14 days old files 