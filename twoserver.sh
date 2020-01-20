#!/bin/sh
ansible-playbook /etc/ansible/webserver.yaml --extra-vars "domain_name=`cat /root/domain_name.txt`" --extra-vars "http_port=`cat /root/port.txt`"
