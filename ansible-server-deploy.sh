#!/bin/bash
#Database_name=`grep -i "database" /tmp/server.txt | awk -F "=" '{print $2}'`
#Database_user=`grep -i "database_user" /tmp/server.txt | awk -F "=" '{print $2}'`
echo > /tmp/file_output.txt
find /var/www/html/ -name "server.txt" -newermt '13 minutes ago' >> /tmp/file_output.txt
cat /tmp/file_output.txt | grep "server.txt"
if [ $? -eq 0 ]
then
#ansible-playbook /etc/ansible/mysql.yaml --extra-vars '$Database_name' --extra-vars '$Database_user'
ansible-playbook /etc/ansible/mysql.yaml --extra-vars "Database_name=`grep -i "database_name" /var/www/html/server.txt | awk -F ":" '{print $2}'`" --extra-vars "Database_user=`grep -i "database_user" /var/www/html/server.txt | awk -F ":" '{print $2}'`" --extra-vars "Database_password=`grep -i "database_password" /var/www/html/server.txt | awk -F ":" '{print $2}'`"
ansible-playbook /etc/ansible/webserver.yaml --extra-vars "Domain_name=`grep -i "domain_name" /var/www/html/server.txt | awk -F ":" '{print $2}'`"
      #echo "$Database_name"
      #echo "$Database_user"
fi
