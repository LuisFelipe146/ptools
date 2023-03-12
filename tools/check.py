import os
import platform
import socket
import subprocess

rede = "172.17.0."

portas_comuns = [21, 22, 23, 25, 53, 80, 110, 119, 123, 143, 161, 194, 443, 465, 587, 993, 995, 1080, 1433, 3306, 3389, 5900, 8080, 8443, 8888]

sistema = platform.system()
if sistema == "Windows":
    comando_ping = ["ping", "-n", "1"]
else:
    comando_ping = ["ping", "-c", "1"]

for host in range(1, 255):
    ip = rede + str(host)

    ping = subprocess.Popen(comando_ping + [ip], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    _, erro_ping = ping.communicate()

    if ping.returncode == 0:
        print("\033[32m"+ ip + " está UP [*] \033[0m")
        
        for porta in portas_comuns:
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.settimeout(1)
            
            resultado = sock.connect_ex((ip, porta))
            
            if resultado == 0:
                print("\033[32m┕Porta " + str(porta) + " está aberta [*] \033[0m")
            sock.close()
    else:
        print(ip + "\033[31m está DOWN \033[0m")

