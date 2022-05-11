#!/usr/bin/env bash

ip=''
shares=('C$' 'D$' 'ADMIN$' 'IPC$' 'PRINT$' 'FAX$' 'SYSVOL' 'NETLOGON')

for i in ${shares[*]};
do
saida=$(smbclient -U '%' -N \\\\$ip\\$i -c '')
	if [[ -z $saida ]]; then
		echo -e "\e[32;1m[*] Found! \e[m$ip\\\\\\$i"
	else
		echo -e "\e[31;1m[!] Error! \e[m$i"
	fi
done
