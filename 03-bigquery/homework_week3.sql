-- Creating external table referring to gcs path
CREATE OR REPLACE EXTERNAL TABLE `ny-rides-z82024.week3_hw.external_green_taxi_2022`
OPTIONS (
  format = 'parquet',
  uris = ['gs://z82024-bucket-1/green_2022/*.parquet']
);

-- Create a non partitioned table from external table
CREATE OR REPLACE TABLE ny-rides-z82024.week3_hw.green_taxi_2022_non_partitioned AS 
SELECT * FROM ny-rides-z82024.week3_hw.external_green_taxi_2022;

-- Q1: Count total records
SELECT COUNT(VendorID) FROM ny-rides-z82024.week3_hw.green_taxi_2022_non_partitioned; 

-- Q2: Estimate amount of data that will be read by query
SELECT COUNT(DISTINCT(PULocationID)) FROM ny-rides-z82024.week3_hw.external_green_taxi_2022; 
SELECT COUNT(DISTINCT(PULocationID)) FROM ny-rides-z82024.week3_hw.green_taxi_2022_non_partitioned; 

-- Q3: Count records that have fare_amount = 0
SELECT COUNT(fare_amount) FROM ny-rides-z82024.week3_hw.green_taxi_2022_non_partitioned WHERE fare_amount = 0;

-- Q4: Create a partitioned table from external table. Partition by lpep_pickup_datetime Cluster on PUlocationID
CREATE OR REPLACE TABLE ny-rides-z82024.week3_hw.green_taxi_2022_partitioned 
  PARTITION BY DATE(lpep_pickup_datetime) 
  CLUSTER BY PUlocationID
AS
  SELECT * FROM ny-rides-z82024.week3_hw.external_green_taxi_2022;

-- Q5: 
SELECT COUNT(DISTINCT PUlocationID) FROM ny-rides-z82024.week3_hw.green_taxi_2022_non_partitioned 
  WHERE DATE(lpep_pickup_datetime) BETWEEN '2022-06-01' AND '2022-06-30';
SELECT COUNT(DISTINCT PUlocationID) FROM ny-rides-z82024.week3_hw.green_taxi_2022_partitioned 
  WHERE DATE(lpep_pickup_datetime) BETWEEN '2022-06-01' AND '2022-06-30';
