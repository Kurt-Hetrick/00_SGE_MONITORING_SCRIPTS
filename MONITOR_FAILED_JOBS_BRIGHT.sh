#!/bin/bash

ROWS=$1 # HOW MANY LINES OF OUTPUT DO YOU WANT SHOW ON THE SCREEN
USER=$2 # UNIX LOGIN USERNAME, IF YOU WANT TO SHOW ALL USERS ENTER "." FOR THIS ARGUMENT
REFRESH=$3 # HOW OFTEN YOU WANT THE SCREEN TO REFRESH IN SECONDS

while sleep $REFRESH ;\
do clear ;\
tail -n 500000 /cm/shared/apps/sge/var/default/common/accounting \
| awk 'BEGIN {FS=":"} $12!=0||$13!=0 {print $4,$2,$5,$6,strftime("%F.%H-%M-%S",$9),strftime("%F.%H-%M-%S",$10),strftime("%F.%H-%M-%S",$11),$12,$13}' \
| grep $USER \
| tail -n $ROWS \
| sort -k 4nr \
| awk 'BEGIN {print "User","Host","Job_Name","Job_Number","SUBMIT","START","END","Failed","Exit"} {print $0}' \
| sed 's/ /\t/g';\
done
