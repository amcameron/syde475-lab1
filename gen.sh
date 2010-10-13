#!/bin/sh

mkdir -p files

yes | ./part4.m
yes | ./part6.m

for file in files/*.eps; do
	epstopdf "$file";
done
