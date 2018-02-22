#!/bin/bash

module load sge

REFRESH=$1

while sleep $REFRESH ;\
 do clear;\
 qstat -f -s r \
| egrep -v "^-|^[0-9]|^ " \
| sed -r 's/[[:space:]]+/\t/g' \
| awk 'BEGIN {FS="\t"};{OFS="\t"} {print $1,$3,$4,$6}' ;\
 done
