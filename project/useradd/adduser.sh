#!/bin/bash

# This script creates a new user on the local system.
# You will be prompted to enter the username(login),the person name,and a password.
# The username, password and host for the account will be displayed.

# make sure the script is being run in superuser priviledges

if [[ "${UID}" -ne 0 ]]
then
    echo "Please run with sudo or as root."
    exit 1
fi

# Get the username(login)
read -p "Enter the username to create:" USER_NAME

# Get the real name (contents for the descriptions field)
read -p "Enter name of the person that will be using this account:" COMMENT

# create the account
useradd -c "${COMMENT}" -m "${USER_NAME}"

# Check to see is the useradd command succeeded.
# We don't want to tell the user that an account was created when it has't been.

if [[ "${?}" -ne 0 ]]
then 
    echo "The account could not be crated."
    exit 1
fi

# set the password
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

if [[ "${?}" -ne 0 ]]
then 
    echo "The passwod for the account could not be set."
    exit 1
fi
# Force password change on first login.
passwd -e ${USER_NAME}

# Display the username, password, and the host where the user was created.
echo 
echo 'Username:' ${USER_NAME}
echo
echo "Password:" ${PASSWORD}
echo 
echo "Hostname:" ${HOSTNAME}
exit 0