#!/bin/bash

## File Encryption and Decreption

echo "Enter file name"
read -r fname

if [ -f $fname ] 
then  
    echo "-----File Content decreption-----"
    cat $fname | base64 -d
else
    echo "not exist but making rightnow"
    echo "write somthing in file!!"
    read -r letter
    touch $fname.txt
    echo $letter | base64 >> $fname.txt
    echo "File Created"
fi