#/bin/sh
#if [[ $# -ne 1 ]]
#then
#   echo "Usage: $0 <>"
#   exit
#fi

#export URL="$1"
echo "starting verification" >> /tmp/status

RESPONSE=`curl -i -s http://localhost:8080/charge/heartBeat | grep ^HTTP  | awk '{print $2}'`

if  [[$RESPONSE == "200"]]
#if [ $RESPONSE -eq 200 ]
then
   echo "Response: 0"
   exit
else
   echo "Response: 1"
fi
