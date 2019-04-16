#!/bin/bash
DIR=$(pwd)
if [ -z $1 ]; then
	NAME=hashSums
else
	NAME=$1
fi

if [ ! -f $DIR/config ]; then
    echo "config not found!"
		echo "You must make a config file where you"
		echo "specify each file to hash with absolute path"
		echo "separated by newline"
		exit
fi
config=$DIR/config
while IFS= read -r VAR
do
	SHASUM=`cat $VAR  | shasum`
	echo $SHASUM $VAR >> $NAME
done < "$config"
