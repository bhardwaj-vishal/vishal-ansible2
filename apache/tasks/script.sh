#!/bin/bash
#> /var/log/httpd/new_httpd_log
for (( i = 5; i >=0; i-- )) ; do
     grep $(date +%R -d "-$i  min ") /var/log/httpd/error_log
done
