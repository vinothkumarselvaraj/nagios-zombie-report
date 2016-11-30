#!/bin/bash
#
# Author: Vinoth Kumar Selvaraj
# E-Mail: vinothkumar.s@cloudenablers.com
# Bash script to kill the nagios.cfg process created during host addition using external commands
#
#

ps -ef | grep nagios.cfg > /tmp/nagios-pid

count=`grep -o "nagios.cfg" /tmp/nagios-pid | wc -l`

if [ $count -gt 3 ]
then
  service nagios restart
  echo "Nagios restarted `date`" >> /var/log/nagios-zombie-log.txt
fi
