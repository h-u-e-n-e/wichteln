#!/bin/bash

outfile=result
infile=names

cat ${infile} | while read line; do
  name=$(echo $line | awk -F ':' '{print $1}')
  mail=$(echo $line | awk -F ':' '{print $2}')
  people=$(egrep "^${name}:" ${outfile})
  txt="Hello ${name}, you're the secret santa for "$(echo ${people} |  awk -F ':' '{print $2,"and",$3". Have fun!"}')
  /script/for/actual/mailcommand.sh -s "subject" -r ${mail} -t "${txt}"
done
