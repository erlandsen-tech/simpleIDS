#!/bin/bash
DIR=$(pwd)
config=$DIR/config
while IFS= read -r var
do
	cat $var | sha512sum >> hashSums
done < "$config"
