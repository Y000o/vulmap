
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
echo -e " /             \                                                "
echo -e "|    ()   ()    |                                               "
echo -e "(_     /|\     _)                                               "
echo -e " \_\,,,,,,,,,/_/                                                "
echo -e "    \_'''''_/     09-06-2020 | creado por: _Y000!_   "
echo
echo -e "----------------------------------------------------------------"
echo
echo -e " [01] Escaneos dirigidos a WORDPRESS"
echo -e " [02] Herramienta sqlmap"
echo -e " [03] Acerca de mi"
echo -e " [04] Salir"
echo
echo -n -e "nse-nmap > "
read -r vulmenu
if [ "$vulmenu" == "01" ] || [ "$vulmenu" == "1" ];
	then
	clear
	echo -e " ---------------------------------------------------------------"
	echo
	echo -e " /             \                                                "
	echo -e "|    ()   ()    |                                               "
	echo -e "(_     /|\     _)                                               "
	echo -e " \_\,,,,,,,,,/_/                                                "
	echo -e "    \_'''''_/      09-06-2020 | creado por: _Y000!_             "
	echo
	echo -e "----------------------------------------------------------------"
	echo
	echo -e " Escaneos a WORDPRESS"
	echo 
	echo -e " [01] Fuerza bruta de usuarios"
	echo -e " [02] Deteccion de Temas y Plugins"
	echo
	echo -n -e "nse-nmap >"
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
		nmap -sS "$iphostname"
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
