clear
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'
blue='\033[0;34m'
ungu='\033[0;35m'
Green="\033[32m"
Red="\033[31m"
WhiteB="\e[5;37m"
BlueCyan="\e[5;36m"
Green_background="\033[42;37m"
Red_background="\033[41;37m"
Suffix="\033[0m"


echo -e "\e[33;1m┌─────────────────────────────────────────────────┐\e[0m"
echo -e "\e[33;1m│\e[44;97;1m             • BACKUP FEATURES •              \e[0m"             
echo -e "\e[33;1m└─────────────────────────────────────────────────┘\e[0m"
echo -e "\e[33;1m┌─────────────────────────────────────────────────┐\e[0m"
echo -e "\e[37;1m [1] Backup"
echo -e "\e[37;1m [2] Restore"
echo -e "\e[37;1m [3] strt"
echo -e "\e[37;1m [4] limit speed"
echo -e "\e[37;1m [5] autobackup \e[0m"
echo -e "\e[33;1m└─────────────────────────────────────────────────┘\e[0m"
echo
read -p    " Just Input Number └╼>>>  " bro

if [ $bro = 1 ] || [ $bro = 1 ]
then
figlet "backup" | lolcat
mbackup
echo -e "\e[33;1m┌─────────────────────────────────────────────────┐\e[0m"
echo -e "\e[33;1m│\e[44;97;1m            • LUNATIC TUNNELING •              \e[0m"             
echo -e "\e[33;1m└─────────────────────────────────────────────────┘\e[0m"
fi

if [ $bro = 2 ] || [ $bro = 2 ]
then
figlet "Restore" | lolcat
mrestore
echo -e "\e[33;1m┌─────────────────────────────────────────────────┐\e[0m"
echo -e "\e[33;1m│\e[44;97;1m            • LUNATIC TUNNELING •              \e[0m"             
echo -e "\e[33;1m└─────────────────────────────────────────────────┘\e[0m"
fi
if [ $bro = 3 ] || [ $bro = 3 ]
then
figlet "strt"
mstrt
echo -e "\e[33;1m┌─────────────────────────────────────────────────┐\e[0m"
echo -e "\e[33;1m│\e[44;97;1m            • LUNATIC TUNNELING •              \e[0m"             
echo -e "\e[33;1m└─────────────────────────────────────────────────┘\e[0m"
fi
if [ $bro = 4 ] || [ $bro = 4 ]
then
mlimitspeed
echo -e "\e[33;1m┌─────────────────────────────────────────────────┐\e[0m"
echo -e "\e[33;1m│\e[44;97;1m            • LUNATIC TUNNELING •              \e[0m"             
echo -e "\e[33;1m└─────────────────────────────────────────────────┘\e[0m"
fi

if [ $bro = 5 ] || [ $bro = 5 ]
then
mautobackup
echo -e "\e[33;1m┌─────────────────────────────────────────────────┐\e[0m"
echo -e "\e[33;1m│\e[44;97;1m            • LUNATIC TUNNELING •              \e[0m"             
echo -e "\e[33;1m└─────────────────────────────────────────────────┘\e[0m"
fi
