#!/bin/bash

echo "this is file encription/decription"
echo "choose what u want to do "

choice="Encryption Decription"

select option in $choice; do
    if [ $REPLY = 1 ];
    then
        echo "You have selet encryption"
        echo "Provide file name"
        read file;
        gpg -c $file
        echo "the file has been encrypted"
    else 
        echo "You have select decryption"
        echo "please enter the file name"
        read file2
        gpg -d $file2
        echo "The file has been decrypted"
    fi
done