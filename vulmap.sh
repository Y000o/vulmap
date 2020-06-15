#!/usr/bin/bash
# Nse-nmap v1.1
# Author: _Y000!_
if [ "$(whereis nmap)" == "" ]; then
        echo -n -e "nmap será instalado... [y/N] "
        read -r yorn
        if [ "$yorn" == "y" ] || [ "$yorn" == "Y" ]; then
                apt install nmap
        elif [ "$yorn" == "n" ] || [ "$yorn" == "N" ]; then
                exit
        else
                apt install nmap
        fi
fi
clear
echo -e " ---------------------------------------------------------------"
echo
echo -e "                   _        _______  _______  _______           "
echo -e "|\     /||\     /|( \      (       )(  ___  )(  ____ )			 "
echo -e "| )   ( || )   ( || (      | () () || (   ) || (    )| 		 "
echo -e "| |   | || |   | || |      | || || || (___) || (____)|			 "
echo -e "( (   ) )| |   | || |      | |(_)| ||  ___  ||  _____)			 "
echo -e " \ \_/ / | |   | || |      | |   | || (   ) || (      			 "
echo -e "  \   /  | (___) || (____/\| )   ( || )   ( || )      			 "
echo -e "   \_/   (_______)(_______/|/     \||/     \||/       			 "
echo                                             
echo -e "                             09-06-2020 | creado por: _Y000!_   "
echo
echo -e "----------------------------------------------------------------"
echo
echo -e " [01] Escaneos dirigidos a WORDPRESS"
echo -e " [02] Escaneo de inyeccion xss"
echo -e " [03] Escaneo de inyeccion sql"
echo -e " [05] Salir"
echo -e " [04] Acerca de mi"
echo -e " [05] Salir"
echo
echo -n -e "vulmap > "
read -r vulmenu
if [ "$vulmenu" == "01" ] || [ "$vulmenu" == "1" ];
	then
	clear
	echo -e " ---------------------------------------------------------------"
	echo
	echo -e "                   _        _______  _______  _______           "
	echo -e "|\     /||\     /|( \      (       )(  ___  )(  ____ )			 "
	echo -e "| )   ( || )   ( || (      | () () || (   ) || (    )| 		 "
	echo -e "| |   | || |   | || |      | || || || (___) || (____)|			 "
	echo -e "( (   ) )| |   | || |      | |(_)| ||  ___  ||  _____)			 "	
	echo -e " \ \_/ / | |   | || |      | |   | || (   ) || (      			 "
	echo -e "  \   /  | (___) || (____/\| )   ( || )   ( || )      			 "
	echo -e "   \_/   (_______)(_______/|/     \||/     \||/       			 "
	echo                                             
	echo -e "                             09-06-2020 | creado por: _Y000!_   "
	echo
	echo -e "----------------------------------------------------------------"
	echo
	echo -e " Escaneos a WORDPRESS"
	echo 
	echo -e " [01] Fuerza bruta de usuarios"
	echo -e " [02] Deteccion de Temas y Plugins"
	echo -e " [00] Atras (menu)"
	echo
	echo -n -e "vulmap | WORDPRESS >"
	read -r vulwordp
		if [ "$vulwordp" == "01" ] || [ "$vulwordp" == "1" ];
		then
		echo
		echo -n -e "Escribe la IP o la pagina: "
		read -r iphostname
		echo
		nmap --script http-wordpress-brute.nse -p 80,443  "$iphostname"
		read -rsp $'Presiona alguna tecla para continuar ...\n' -n 1 key
		bash "$0"

		elif [ "$vulwordp" == "02" ] || [ "$vulwordp" == "2" ];
		then
		echo
		echo -n -e "Escribe la IP o la pagina: "
		read -r iphostname
		echo
		nmap --script http-wordpress-enum.nse -p 80,443 "$iphostname"
		read -rsp $'Presiona alguna tecla para continuar ...\n' -n 1 key
		bash "$0"

		elif [ "$vulwordp" == "00" ] || [ "$vulwordp" == "0" ];
		then
		echo -e "\033[1;31m[!] Atras..\033[1;0m"
		bash "$0"

		else
		echo
		echo -e "\033[1;31m[!] Elegiste mal...\033[1;0m"
		sleep 1
		bash "$0"
		fi

elif [ "$vulmenu" == "02" ] || [ "$vulmenu" == "2" ];
then
	clear
	echo -e " ---------------------------------------------------------------"
	echo
	echo -e "                   _        _______  _______  _______           "
	echo -e "|\     /||\     /|( \      (       )(  ___  )(  ____ )			 "
	echo -e "| )   ( || )   ( || (      | () () || (   ) || (    )| 		 "
	echo -e "| |   | || |   | || |      | || || || (___) || (____)|			 "
	echo -e "( (   ) )| |   | || |      | |(_)| ||  ___  ||  _____)			 "
	echo -e " \ \_/ / | |   | || |      | |   | || (   ) || (      			 "
	echo -e "  \   /  | (___) || (____/\| )   ( || )   ( || )      			 "
	echo -e "   \_/   (_______)(_______/|/     \||/     \||/       			 "
	echo                                             
	echo -e "                             09-06-2020 | creado por: _Y000!_   "
	echo
	echo -e "----------------------------------------------------------------"
	echo 
	echo -e " [01] Deteccion de XSS"
	echo -e " [00] Atras (menu)"
	echo
	echo -n -e "vulmap | XSS >"
	read -r vulxss
	if [ "$vulxss" == "01" ] || [ "$vulxss" == "1" ];
		then
		echo
		echo -n -e "Escribe la IP o la pagina: "
		read -r iphostname
		echo
		nmap -sV --script http-dombased-xss.nse, http-phpself-xss.nse, http-stored-xss.nse, http-xssed.nse  -p 80,443  "$iphostname"
		read -rsp $'Presiona alguna tecla para continuar ...\n' -n 1 key
		bash "$0"

		elif [ "$vulxss" == "00" ] || [ "$vulxss" == "0" ];
		then
		echo -e "\033[1;31m[!] Atras..\033[1;0m"
		bash "$0"

		else
		echo
		echo -e "\033[1;31m[!] Elegiste mal...\033[1;0m"
		sleep 1
		bash "$0"
		fi

elif [ "$vulmenu" == "03" ] || [ "$vulmenu" == "3" ];
	then
	clear
	echo -e " ---------------------------------------------------------------"
	echo
	echo -e "                   _        _______  _______  _______           "
	echo -e "|\     /||\     /|( \      (       )(  ___  )(  ____ )			 "
	echo -e "| )   ( || )   ( || (      | () () || (   ) || (    )| 		 "
	echo -e "| |   | || |   | || |      | || || || (___) || (____)|			 "
	echo -e "( (   ) )| |   | || |      | |(_)| ||  ___  ||  _____)			 "	
	echo -e " \ \_/ / | |   | || |      | |   | || (   ) || (      			 "
	echo -e "  \   /  | (___) || (____/\| )   ( || )   ( || )      			 "
	echo -e "   \_/   (_______)(_______/|/     \||/     \||/       			 "
	echo                                             
	echo -e "                             09-06-2020 | creado por: _Y000!_   "
	echo
	echo -e "----------------------------------------------------------------"
	echo
	echo -e " Deteccion de errores para inyeccion sql "
	echo 
	echo -e " [01] Deteccion de SQL"
	echo -e " [00] Atras (menu)"
	echo
	echo -n -e "vulmap | SQL >"
	read -r vulsql
	if [ "$vulsql" == "01" ] || [ "$vulsql" == "1" ];
		then
		echo
		echo -n -e "Escribe la IP o la pagina: "
		read -r iphostname
		echo
		nmap -sV --script http-sql-injection.nse  -p 80,443  "$iphostname"
		read -rsp $'Presiona alguna tecla para continuar ...\n' -n 1 key
		bash "$0"

		elif [ "$vulsql" == "00" ] || [ "$vulsql" == "0" ];
		then
		echo -e "\033[1;31m[!] Atras..\033[1;0m"
		bash "$0"

		else
		echo
		echo -e "\033[1;31m[!] Elegiste mal...\033[1;0m"
		sleep 1
		bash "$0"
		fi

elif [ "$vulmenu" == "04" ] || [ "$vulmenu" == "4" ];
	then
	clear
	echo -e " ---------------------------------------------------------------"
	echo
	echo -e "                   _        _______  _______  _______           "
	echo -e "|\     /||\     /|( \      (       )(  ___  )(  ____ )			 "
	echo -e "| )   ( || )   ( || (      | () () || (   ) || (    )| 		 "
	echo -e "| |   | || |   | || |      | || || || (___) || (____)|			 "
	echo -e "( (   ) )| |   | || |      | |(_)| ||  ___  ||  _____)			 "	
	echo -e " \ \_/ / | |   | || |      | |   | || (   ) || (      			 "
	echo -e "  \   /  | (___) || (____/\| )   ( || )   ( || )      			 "
	echo -e "   \_/   (_______)(_______/|/     \||/     \||/       			 "
	echo                                             
	echo -e "                             09-06-2020 | creado por: _Y000!_   "
	echo
	echo -e "----------------------------------------------------------------"
	echo
	echo -e " Deteccion de errores para inyeccion sql "
	echo 
	echo -e " [01] Escanear un servicio FTP"
	echo -e " [00] Atras (menu)"
	echo
	echo -n -e "vulmap | SQL >"
	read -r vulsql
	if [ "$vulftp" == "01" ] || [ "$vulftp" == "1" ];
		then
		echo
		echo -n -e "Escribe la IP o la pagina: "
		read -r iphostname
		echo
		nmap -sV --script ftp-anon.nse, ftp-bounce.nse, ftp-brute.nse, ftp-libopie.nse, ftp-proftpd-backdoor.nse, ftp-syst.nse  -p 21  "$iphostname"
		read -rsp $'Presiona alguna tecla para continuar ...\n' -n 1 key
		bash "$0"

		elif [ "$vulftp" == "00" ] || [ "$vulftp" == "0" ];
		then
		echo -e "\033[1;31m[!] Atras..\033[1;0m"
		bash "$0"

		else
		echo
		echo -e "\033[1;31m[!] Elegiste mal...\033[1;0m"
		sleep 1
		bash "$0"
		fi


elif [ "$vulmenu" == "03" ] || [ "$vulmenu" == "3" ];
then
echo
echo -e "\033[1;31m[!] Creado por _Y000!_... \033[1;0m"
sleep 10
bash "$0"
elif [ "$vulmenu" == "04" ] || [ "$vulmenu" == "4" ];
then
exit
fi
fi
