#!/bin/bash
### Load Monitoring ##
## Script to monitor loadavg ##
## Author Qasim on Feb 20 2014 ##
## The script will only trigger when load is at 8 ##

SysLoadAvg=`cat /proc/loadavg | awk '{print $1}' | cut -d . -f 1`
if [[ $SysLoadAvg -ge 25 ]]; then
/etc/init.d/mysql stop
sleep 5
/etc/init.d/cpanel stop
sleep 5
/etc/init.d/httpd stop && /etc/init.d/nginx stop
sleep 5
sar -q | mail -r support@websouls.com -s " I Have Stopped The Services Cpanel, MySQL, HTTP, Exim Cauzz Of High load on server $HOSTNAME - [ 
$load ]" qasim@websouls.com  usama@websouls.com omair@websouls.com waqas@websouls.com
sleep 5
/etc/init.d/exim stop
fi
