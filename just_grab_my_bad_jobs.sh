#!/bin/bash

USER=$1 # UNIX LOGIN USERNAME, IF YOU WANT TO SHOW ALL USERS ENTER "." FOR THIS ARGUMENT
ROWS=$2 # HOW MANY LINES OF OUTPUT DO YOU WANT SHOW ON THE SCREEN

awk 'BEGIN {FS=":"} $12!=0||$13!=0 {print $4,$2,$5,$6,strftime("%F.%H-%M-%S",$9),strftime("%F.%H-%M-%S",$10),strftime("%F.%H-%M-%S",$11),$12,$13}' \
/cm/shared/apps/sge/var/default/common/accounting \
| grep $USER \
| tail -n $ROWS \
| sort -k 4,4nr \
| awk 'BEGIN {print "User","Host","Job_Name","Job_Number","SUBMIT","START","END","Failed","Exit"} {print $0}' \
| sed 's/ /\t/g'
