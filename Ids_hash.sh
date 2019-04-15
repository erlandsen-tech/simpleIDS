#!/bin/bash
DIR=$(pwd)
if [ -z $1 ]; then
	NAME=hashSums
else
	NAME=$1
fi

if [ ! -f $DIR/config ]; then
    echo "config not found!"
		echo "You must make a config"
		exit
fi
config=$DIR/config
while IFS= read -r VAR
do
	cat $VAR | sha512sum >> $NAME
done < "$config"
