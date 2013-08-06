#!/bin/bash

path=$1
days=$2

# find all files modified x days ago
files=`find ${path} -mtime -${days} -type f`

# Set variable
byteCount=0;

for file in ${files[*]};
do
		bytes=`du -b ${file} | awk '{print $1}'`;
		let "byteCount=${byteCount} + ${bytes}";
done;

# convert bytes to MBs
echo ${byteCount}

mbCount=${byteCount} / 1024 / 1024


# Output the MB's
echo "Total MB's: ${mbCount}MB"
