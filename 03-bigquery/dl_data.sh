#!/bin/sh

for i in 01 02 03 04 05 06 07 08 09 10 11 12 13
do
	wget "https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2022-${i}.parquet" -P ./data
done

for file in `ls ./data`
do
	gsutil cp ./data/${file} gs://z82024-bucket-1/green_2022/
done	


