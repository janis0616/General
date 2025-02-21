#!/usr/bin/env bash

printf "sample,fastq_1,fastq_2\n" > samplesheet.csv

for dir in */
do
	cd $dir
	echo "$dir" | cut -d/ -f1 | tr -d '\n' >> ../samplesheet.csv
	for file in *
	do
		printf "," >> ../samplesheet.csv
		realpath ${file} | tr -d '\n' >> ../samplesheet.csv
	done
	printf "\n" >> ../samplesheet.csv
	cd ..
done

