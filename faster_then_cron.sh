#!/bin/bash
#This script run every 15 seconds
while (sleep 15 && php /path_to_script/faster_than_cron.php) &
do
  wait $!
done
