#!/bin/bash
# Author Jiri Volprecht

if [ "$#" -ne 2 ]; then
	echo "Incorrect number of arguments!
	echo "Usage: ./script.sh USERNAME PASSWORD""
	exit 2
fi

groupadd ftpu

USERNAME=$1
PASS=$2

DIR_TO_CREATE="/var/www/$USERNAME"

if [ ! -d "$DIR_TO_CREATE" ]; then
	mkdir -p $DIR_TO_CREATE
fi

chmod 775 $DIR_TO_CREATE
chown $USER:ftpu $DIR_TO_CREATE

useradd -g "ftpu" -d "$DIR_TO_CREATE" -s /bin/bash $USERNAME 
echo "$USERNAME:$PASS" | chpasswd

echo "DONE"

