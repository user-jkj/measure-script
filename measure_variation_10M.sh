#!/bin/sh
# measure_variation_10M.sh

URL=http://127.0.0.1/target/10M.dat
FILE=resolt/data_variation_10M.dat

mkdir -p resolt
rm -f ${FILE}

for i in $(seq 1000)
do
    echo -n "${i} " >> ${FILE}
    ab -c 10 -n 1000 ${URL} | grep 'Requests per second' | sed -r 's/.*( +)([0-9]+\.[0-9][0-9]) .*/\2/' >> ${FILE}
done
