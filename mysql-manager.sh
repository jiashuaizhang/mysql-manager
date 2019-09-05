#!/bin/bash

host="localhost"
port="3306"
user="root"
password="123456"

databases=$(mysql -h$host -P$port -u$user -p$password -e"show databases" |awk '{if(NR > 1) print $1}')
for var in ${databases[@]}
do
   ddl="drop database "$var";"
   batch=$batch$ddl
done
mysql -h$host -P$port -u$user -p$password -e"$batch"
echo all done,congratulations!
