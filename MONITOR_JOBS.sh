#!/bin/bash

module load sge

ROWS=$1 # HOW MANY LINES OF OUTPUT DO YOU WANT SHOW ON THE SCREEN
USER=$2 # UNIX LOGIN USERNAME, IF YOU WANT TO SHOW ALL USERS ENTER "." FOR THIS ARGUMENT
REFRESH=$3 # HOW OFTEN YOU WANT THE SCREEN TO REFRESH IN SECONDS

while sleep $REFRESH ;\
 do clear ;\
 qstat -ext -pri -u "*" \
| grep $USER \
| egrep -v "^job|^--" \
| head -n $ROWS \
| sed -r 's/[[:space:]]+/\t/g' \
| awk 'BEGIN {print "JOB_ID","PRIORITY","JOB_NAME","USER","STATUS","SUB_DATE","SUB_TIME","CPU","MEM","IO","NODE"} \
{print $1,$6,$7,$8,$11,$12,$13,$14,$15,$16,$23}' \
| sed 's/ /\t/g' ;\
 done
