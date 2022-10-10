#!/usr/bin/env bash

verbose=off
tempo=$(date '+%H:%M:%S')

if [ "$2" = "-v" ]
then
	verbose=on
fi

case $1 in
-h)
echo -e "\nModo de uso: $0 [-CBA]\n"
;;
-C)
read -p "IP:" ip
echo -e "\nScript Iniciado: $tempo\n"
for i in $(seq 0 255);
do
ping -b -c 1 -W 1 $ip.$i -q  >> /dev/null
	if [ $? == "0" ]
	then
		echo -e "\e[32;1m[*]\e[m Host $ip.$i\t\e[32;1mUP\e[m"
	elif [ $verbose = "on" ]
	then
		echo -e "\e[31;1m[*]\e[m Host $ip.$i\t\e[31;1mOFF\e[m"
	fi
done
echo -e "\nScript Finalizado: $tempo\n"
;;
-B)
echo "B"
;;
*)
$0 -h
;;
esac
