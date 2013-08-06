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
mbCount=`echo ${byteCount} | awk '{ foo = $1 / 1024 / 1024 ; print foo "MB" }'`

# Output the KB's
echo "Total B's: ${byteCount}"

# Output the MB's
echo "Total MB's: ${mbCount}"
