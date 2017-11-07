#!/bin/bash
file="/data/backup/proc_res.py"
if [ -f "$file" ]
then
rm -rf $file
cp /data/backup/api/scripts/proc_res.py /data/backup/
nohup python /data/backup/proc_res.py nucleus-api nucleus-pages > test.log 2>&1 < /dev/null &
exit 0

else
        echo "i am in loop" >> /tmp/status
        cp /data/backup/api/scripts/proc_res.py /data/backup/
        echo "copy completed" >> /tmp/status
        nohup python /data/backup/proc_res.py nucleus-api nucleus-pages > test.log 2>&1 < /dev/null &
        echo "ran python completed" >> /tmp/status

fi
exit 0

