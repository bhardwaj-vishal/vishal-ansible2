#!/bin/bash
> /opt/log/httpd/new_httpd.log
for (( i = 5; i >=0; i-- )) ; do
     grep $(date +%R -d "-$i  min ") /var/log/httpd/error.log  >>  /opt/log/httpd/new_httpd.log
done
