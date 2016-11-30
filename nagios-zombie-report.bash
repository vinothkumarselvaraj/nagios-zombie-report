#!/bin/bash
#
# Author: Vinoth Kumar Selvaraj
# E-Mail: vinothkumar.s@cloudenablers.com
# Bash script to send mail when ps list has more than 3 occurrence of nagios.cfg process
#
#

ps -ef | grep nagios.cfg > /usr/local/nagios/var/rw/nagios-pid.txt

count=`grep -o "nagios.cfg" /usr/local/nagios/var/rw/nagios-pid.txt | wc -l`

if [ $count -gt 3 ]
then
       subject="IMPORTANT - To many Nagios process"
       from="cloudlab@cloudenablers.com"
       recipients="vinothkumar.s@cloudenablers.com"
       mail="subject:$subject\nfrom:$from \nNAGIOS SERVER NEEDS ATTENTION \nHOSTNAME:`hostname -f` \nIP_Detail:`hostname -I` \n`date`"
       echo -e $mail | /usr/sbin/sendmail "$recipients"

fi
