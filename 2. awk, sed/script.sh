#!/bin/bash
i=1
sort hw2.txt > sorted.txt
while read line
do
echo "$line" | cut -d " " -f 1 > ip.txt
ipa=$(cat ip.txt)
echo "" > fixed.txt
if [i <2]
then
sed "s/s/^[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\s/ip ${i}" >> fixed.txt
ipb=$(cat ip.txt);
else
if ["$ipa"=="$ipb"]
then
sed "s/s/^[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\s/ip ${i}" >> fixed.txt
else
let i++;
sed "s/s/^[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\s/ip ${i}" >> fixed.txt
ipb=$(cat ip.txt)
fi
fi
done < sorted.txt