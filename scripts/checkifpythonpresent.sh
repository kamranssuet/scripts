#!/bin/bash
file="/home/ubuntu/proc_res.py"
if [ -f "$file" ]
then
exit
else
        cp /data/backup/api/scripts/proc_res.py /home/ubuntu/
        python /home/ubuntu/proc_res.py nucleus-api nucleus-pages &
fi
