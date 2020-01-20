#!/bin/bash
while :
do
   chk_time=$(ls -l /root/chetan | awk -F" "  '{ print $8 }')
   chk_timehr=$(echo $chk_time | awk -F: '{print $1}')
   chk_timemin=$(echo $chk_time | awk -F: '{print $2}')
   echo $chk_time  $time
  if [ "$chk_timehr" != "$timehr" ] || [ "$chk_timemin" != "$timemin" ]
   then
     time=$(ls -l /root/chetan | awk -F" "  '{ print $8 }')
     timehr=$(echo $time | awk -F: '{print $1}')
     timemin=$(echo $time | awk -F: '{print $2}')
     echo "file changed"
     sleep 5
     echo "file changing"
   fi
   sleep 5  # 5sec wait time
done

