#!/bin/sh
# measure_default_10M.sh

URL=http://127.0.0.1/target/10M.dat
RESOLT_FILE=resolt/data_default_10M.dat
ALLDATA_FILE="resolt/alldata/alldata_default_10M.dat"

mkdir -p resolt/alldata


rm -f ${RESOLT_FILE} ${ALLDATA_FILE}

for request in 100 500 1000 3000 4000 5000 6000 7000 8000 10000 
do
    sum=0
    echo "Request ${request}:" >> ${ALLDATA_FILE}

    for i in $(seq 30)
    do
        result=$(ab -c 10 -n ${request} ${URL} | grep 'Requests per second' | sed -r 's/.*( +)([0-9]+\.[0-9][0-9]) .*/\2/')
        echo "  ${result}" >> ${ALLDATA_FILE} # AllData格納
        sum=$(echo "$sum + $result" | bc)
    done

    ave=$(echo "scale=2; $sum / 5" | bc)
    echo "${request} ${ave}" >> ${RESOLT_FILE} # 平均値記録
done
