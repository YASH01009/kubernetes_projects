#!/bin/bash

export SERVER_IP='20.121.249.106'
export PORT_NO=80

curl http://${SERVER_IP}:${PORT_NO}/

counter=1
request="http://${SERVER_IP}:${PORT_NO}/guestbook.php?cmd=set&value="
time_total=0

while [[ $counter -le 100 ]]
do
    request="$request,$counter"
    # curl -w "@curl-format.txt" -o /dev/null -s ${request}
    time_taken=$(curl -w "%{time_total}" -o /dev/null -s ${request})
    time_total=`echo $time_total + $time_taken | bc`
    ((counter++))
done

printf "\ntime_total: ${time_total}"
