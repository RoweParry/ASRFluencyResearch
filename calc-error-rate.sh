# Script to calculate rate of error usage in transcription corpus

#!/bin/bash

corpus=LANGSNAP
SOURCEDIR=/afs/inf.ed.ac.uk/user/r/rparry2/Documents/fluency-research/SLA-French/$corpus
error= read error

#Extract count of lines containing error and sum
x=$(grep $error $SOURCEDIR/*.cha -c -h | awk '{ SUM += $1} END { print SUM }')
echo $x

#Extract total number of lines
y=$(cat $SOURCEDIR/*.txt | wc -l)
echo $y

#Calculate % error rate to 4 sigfig
echo "scale=2 ; $x / $y *100" | bc
echo "done!"
