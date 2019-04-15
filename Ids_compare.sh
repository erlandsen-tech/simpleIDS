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
./Ids_hash.sh hashSums2
hashes2=$DIR/hashSums2
diff -s $hashes $hashes2
