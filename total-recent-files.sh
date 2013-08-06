#!/bin/bash

path=$1
days=$2

# find all files modified x days ago
files=`find ${path} -mtime -${days} -type f`

# Set variable
byteCount=0;

# loop all files that match the find criteria
for file in ${files[*]};
do
		# Get bytes from this file
		bytes=`du -b ${file} | awk '{print $1}'`;

		# add bytes from this file to byteCount
		let "byteCount=${byteCount} + ${bytes}";
done;

# convert bytes to MBs
mbCount=`echo ${byteCount} | awk '{ MBs = $1 / 1024 / 1024 ; print MBs "MB" }'`

# Output the MB's
echo "Total MB's: ${mbCount}"
