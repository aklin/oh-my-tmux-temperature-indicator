#!/bin/bash

CPU=`sensors -u | grep -A4 'Core*' | grep 'temp[1-5]_input'`
TEMPS=`grep -oP '([0-9]+\.[0-9]+)' <<< $CPU`

count=0
total=0

for line in $TEMPS
do
        total=$(echo $total+$line | bc)
        ((count++))
done

avg=`echo "scale=1; $total / $count" | bc`

echo $avg
