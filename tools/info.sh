#!/usr/bin/env bash
#Coding: UTF-8
#\e[m\n\n Version: \e[34;1m1.0\e[m"

case "$*" in
  -h)
  echo -e "\e[36;1m
  ██╗███╗   ██╗███████╗ ██████╗    ███████╗██╗  ██╗
  ██║████╗  ██║██╔════╝██╔═══██╗   ██╔════╝██║  ██║
  ██║██╔██╗ ██║█████╗  ██║   ██║   ███████╗███████║
  ██║██║╚██╗██║██╔══╝  ██║   ██║   ╚════██║██╔══██║
  ██║██║ ╚████║██║     ╚██████╔╝██╗███████║██║  ██║
  ╚═╝╚═╝  ╚═══╝╚═╝      ╚═════╝ ╚═╝╚══════╝╚═╝  ╚═╝
                                                   \e[m\n Version: \e[34;1m1.0\e[m"
  echo -e ""
  exit;;
  --help)
  $0 -h
  exit;;
  *)
  date '+%D %T'
  echo -e "\t[!] Error [!]"
  echo -e "\t"
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
