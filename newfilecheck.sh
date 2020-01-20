#!/bin/bash
#Database_name=`grep -i "database" /tmp/server.txt | awk -F "=" '{print $2}'`
#Database_user=`grep -i "database_user" /tmp/server.txt | awk -F "=" '{print $2}'`
find /tmp -name "server.txt" -newermt '13 minutes ago' >> /tmp/file_output.txt
cat /tmp/file_output.txt | grep "server.txt"
if [ $? -eq 0 ]
then
#ansible-playbook /etc/ansible/mysql.yaml --extra-vars '$Database_name' --extra-vars '$Database_user'
ansible-playbook mysql.yaml --extra-vars "Database_name=`grep -i "database" /tmp/server.txt | awk -F "=" '{print $2}'`" --extra-vars "Database_user=`grep -i "database_user" /tmp/server.txt | awk -F "=" '{print $2}'`"
      #echo "$Database_name"
      #echo "$Database_user"
fi
