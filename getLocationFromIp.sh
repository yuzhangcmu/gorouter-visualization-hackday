#!/bin/bash
#curl http://freegeoip.net/json/98.234.88.182 >> out.txt

while  read -r line || [[ -n "$line" ]]; do
    
    echo "Text read from file: $line"

    read -r -a array <<< "$line"

    urlPref="http://freegeoip.net/json/"
	ipaddress="${array[1]}"
	
	queryUrl=$urlPref$ipaddress

	queryResult=$(curl "$queryUrl")
	queryResult=${array[0]}" "$queryResult

	echo $queryResult >> out.txt	
done < "$1"
