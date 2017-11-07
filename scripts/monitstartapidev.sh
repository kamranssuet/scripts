#!/bin/sh
PID=`ps -eaf | grep nucleus-api | grep -v grep | awk '{print $2}'`
if [ "" !=  "$PID" ]; then
  echo "killing $PID" >> /tmp/status
  kill -9 $PID
  echo "killing completed" >> /tmp/status
fi
