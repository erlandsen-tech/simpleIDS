#!/bin/bash

DIR=$(pwd)

if [ ! -f $DIR/hashSums ]; then
    echo "File hashSums not found!"
    echo "Please run Ids_Hash.sh first"
		exit
fi

hashes=$DIR/hashSums

if [ ! -f $DIR/Ids_hash.sh ]; then
    echo "Ids_hash.sh must be in same dir"
		exit
fi

#Remove hashSums2 if exists
if [ ! -z hashSums2 ]; then
	rm hashSums2
fi
./Ids_hash.sh hashSums2
hashes2=$DIR/hashSums2
diff --unchanged-line-format= \
     --old-line-format= \
		 --new-line-format='%L' $hashes $hashes2 \
		 | sed -n -e 's/^.*\s-\s//p'

