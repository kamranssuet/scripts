#!/bin/sh

CMD=`tail -n 5 /home/pages/nucleus-pages.log | grep ^ERROR | awk '{print $1}'`

#if [ $CMD == "ERROR" ]
if [ "$CMD" = "ERROR" ]
then
   echo "Response: 1"
   exit
else
   echo "Reponse: 0"
   exit
fi