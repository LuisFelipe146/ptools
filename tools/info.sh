#!/usr/bin/env bash
#Coding: UTF-8
#\e[m Version:\e[m"

date=$(date '+%D %T')

echo -e "\e[36;1m
 ██╗███╗   ██╗███████╗ ██████╗    ███████╗██╗  ██╗
 ██║████╗  ██║██╔════╝██╔═══██╗   ██╔════╝██║  ██║
 ██║██╔██╗ ██║█████╗  ██║   ██║   ███████╗███████║
 ██║██║╚██╗██║██╔══╝  ██║   ██║   ╚════██║██╔══██║
 ██║██║ ╚████║██║     ╚██████╔╝██╗███████║██║  ██║
 ╚═╝╚═╝  ╚═══╝╚═╝      ╚═════╝ ╚═╝╚══════╝╚═╝  ╚═╝
                                                 \e[m\n \e[37;1mVersion: \e[m\e[34;1m1.0\e[m\n"
echo -e "\e[37;1m\t Select your option\e[m"
echo -e "\e[36;1m [1]\e[m Brute force in subdomains"
echo -e "\e[36;1m [1]\e[m Brute force in subdomains"
echo -e "\e[36;1m [1]\e[m Brute force in subdomains"
echo -e "\e[36;1m [1]\e[m Brute force in subdomains\n"

read -p "[Option]:" -n1 resp

case "$resp" in
  1)
  echo -e "\e[37;1m\n\n What address? Use:domain.com\e[m\n"
  read -p "[Target]:" addr
  echo -e "\n\e[31;1m [-] Starting...\e[m"
  sleep 1
  echo -e "\n\e[32;1m [*] Started:\e[m \t$date"
  for i in $(cat ../wordlists/subdomains-10000.txt); do
    #req_ip=$(host $i.$addr | sed 's/has address/ - /')
    req=$(host -T $i.$addr)
    if [ "$?" -eq "0" ]; then
      echo -e "\e[32;1m [*] \e[m\e[37;1mhttp://$i.$addr \t\t\e[m"
    fi
  done
  echo -e "\e[32;1m [*] Done:\e[m \t$date\n"
  exit;;
  *)
  echo -e "\n\e[31;1m [!]\e[m Error \e[31;1m[!]\e[m $date"
  echo -e "\tInvalid option"
  echo -e "\tExiting...\n"
  exit;;
esac

#[ "$1" == "-h" -o "$1" == "--help" ] &&
#echo -e
#\ Modo de uso
# $0 [parâmetro] [alvo]
#-b Brute force em subdomínios, utiliza uma wordlist para scanear o alvo
#-d DNS reverso, utiliza um bloco IP para scanear
#-h Exibe essa aba
#-s Faz scan no alvo [Parsing HTML]
#-t Testa transferência de zona no alvo

#if [ $1 == "-b" ]
#then
#echo -e "\e[33m===========================================================================\e[m"
#echo -e "\e[36m\t\t\tBRUTE FORCE COM A WORLDLIST:\e[m"
#echo -e "\e[36;1m\t\t\t../Worldlists/subdomains-10000.txt	\n\e[m"
#for i in $(cat ../Wordlists/subdomains-10000.txt)
#do
#host $i.$2 | grep -v "NXDOMAIN" | sed 's/has address/\n/g' | sed 's/has IPv6 address/\n/g' | sed 's/is handled by/\n/g' | sed 's/is an alias for/\n/g' | grep -v "connection timed out"
#done
#echo -e "\e[33m===========================================================================\e[m"
#if [ $1 == "-s" ]
#then
#wget -q $2 -O tmp
#echo -e "\e[33m===========================================================================\e[m"
#echo -e "\e[36m\t\t\tLINKS \e[m"
#echo -e "\e[33m===========================================================================\e[m"
#cat tmp | grep "href" | grep "//" | cut -d "/" -f3 | cut -d '"' -f1 | grep -v "><" | grep -v "fonts" | grep -v "www" | sort | uniq
#cat tmp | grep "href" | grep "//" | cut -d "/" -f3 | cut -d '"' -f1 | grep -v "><" | grep -v "fonts" | grep -v "www" | sort | uniq  > tmp2
#echo -e "\e[33m===========================================================================\e[m"
#echo -e "\e[36m\t\t\tIP'S\e[m"
#echo -e "\e[33m===========================================================================\e[m"
#for i in $(cat tmp2);
#do
#host $i | grep -v "Host" | sed 's/has address/\n/g'
#done
#echo -e "\e[33m===========================================================================\e[m"
#echo -e "\e[36m\t\t\tINFORMAÇÕES EXTRAS\e[m"
#echo -e "\e[33m===========================================================================\e[m"
#host -t txt $2 | grep -v "NXDOMAIN"
#echo -e "\e[33m===========================================================================\e[m"
#fi
#if [ $1 == "-t" ]
#then
#for i in $(host -t ns $2 | cut -d " " -f4 2> /dev/null);
#do
#echo -e "\e[33m===========================================================================\e[m"
#echo -e "\e[36m\t\tTESTANDO TRANSFERENCIA DE ZONA NO DOMÍNIO:\e[m"
#echo -e "\e[36;1m\t\t\t$i\n\e[m"
#host -a -l $2 $i 2> /dev/null
#echo -e "\e[33m===========================================================================\e[m"
#done
#fi
#[ -e "tmp" -o -e "tmp2" ] && rm tmp tmp2
