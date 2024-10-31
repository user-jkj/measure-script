#!/bin/sh
# measure_variation_1M.sh

URL=http://127.0.0.1/target/1M.dat
FILE=resolt/data_variation_1M.dat

# resoltディレクトリを作成
mkdir -p resolt

# ファイルの初期化
rm -f ${FILE}

for i in $(seq 1000)
do
    echo -n "${i} " >> ${FILE}
    ab -c 10 -n 10000 ${URL} | grep 'Requests per second' | sed -r 's/.*( +)([0-9]+\.[0-9][0-9]) .*/\2/' >> ${FILE}
done
