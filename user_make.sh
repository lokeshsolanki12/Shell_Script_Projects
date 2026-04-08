#!/bin/bash

if [[ "${UID}" -ne 0 ]]
then 
	echo "please run with sudo or root. "
	exit 1
fi


if [[ "${#}" -lt 1 ]]
then 
	echo "Usage : ${0} USER_NAME [COMMNET]..."
	echo " Create a user with name USER_NAME and comment field of COMMENT"
	exit 1
fi

USER_NAME="${1}"

shift
COMMENT="${@}"

PASSWORD=$(date +%s%N)

useradd -c "$COMMENT" -m $USER_NAME

if [[ $? -ne 0 ]]
then 
	echo "The account could not be created"
	exit 1
fi

echo $PASSWORD | passwd --stdin $USER_NAME

if [[ $? -ne 0 ]]
then 
	echo "Password could not be set"
	exit 1
fi

passwd -e $USER_NAME

echo 
echo "Username : $USER_NAME"
echo 
echo "Password : $PASSWORD"
echo 
echo "Hostname : $(hostname)"





