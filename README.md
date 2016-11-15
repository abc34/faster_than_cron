#faster_than_cron script
Source: https://coderwall.com/p/x0fqmw/run-scripts-on-linux-ubuntu-every-few-seconds-faster-than-cron-can-do-it

With `cron` you can run php scripts every minute but not in shorter period of time. So what can you do when you need to run your script every 15 seconds or even 1 second ?

Create shell sctipt like this one `faster_than_cron.sh`
```bash
#!/bin/bash
#This script run every 15 seconds
while (sleep 15 && php /path_to_script/faster_than_cron.php) &
do
  wait $!
done
```
Make this file executable.
```
$sudo chmod +x /path_to/faster_than_cron.sh
```

Now this script need to be run by system when it boots, so lets change some linux files now. File `/etc/rc.local` is starting with system, so we can add additionsl scripts it can run. Lets edit this file now.

```
$sudo nano /etc/rc.local
```

Add this line into this file before exit 0 line.

```
sh /path_to/faster_than_cron.sh
```

Now reboot your system. This can be used to run any kind of scripts or commands on your system.
