#!/bin/sh
#maketarget.sh
for filesize in 1M 10M 20M 30M 40M 50M 
do
	base64 /dev/urandom | head -c ${filesize} > ${filesize}.dat
done
