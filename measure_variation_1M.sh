#!/bin/sh
#measure_variation.sh
URL=http://127.0.0.1/target/1M.dat
FILE=resolt/data_variation_1M.dat

rm -f ${FILE}

for i in `seq 1000`
do
	echo -n ${i} >> ${FILE}
	echo -n ' ' >> ${FILE}
	ab -c 10 -n 10000 ${URL} |grep 'Requests per second'>> ${FILE}
done
