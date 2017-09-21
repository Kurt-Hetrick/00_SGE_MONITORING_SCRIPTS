#!/bin/bash

module load sge

while sleep 10 ;\
 do clear;\
 qstat -f -q prod.q,test.q,rnd.q,cgc.q,bigmem.q,bigdata.q -s r \
| egrep -v "^-|^[0-9]|^ " \
| sed -r 's/[[:space:]]+/\t/g' \
| awk 'BEGIN {FS="\t"};{OFS="\t"} {print $1,$3,$4,$6}' ;\
 done
