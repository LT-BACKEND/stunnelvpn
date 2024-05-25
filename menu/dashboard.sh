#!/bin/bash
# =========================================
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"

trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let tra=$trx/2
ssx=$(grep -c -E "^## " "/etc/xray/config.json")
let ssa=$ssx/2
COLOR1='\033[0;35m'
COLOR2='\033[0;39m'
clear
# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;36m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;35m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR \e[0m]"
export INFO="[\e[34;1m INFO \e[0m]"
export OKEY="[\e[33;1m OKEY \e[0m]"
export PENDING="[\e[34;1m PENDING \e[0m]"
export SEND="[\e[34;1m SEND \e[0m]"
export RECEIVE="[\e[34;1m RECEIVE \e[0m]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# // Exporting URL Host
export Server_URL="autosc.me/aio"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther="XdrgVPN"
# Getting
echo "sedang memverifkasi"
MYIP=$(wget -qO- ipinfo.io/ip);
CEKEXPIRED () {
    today=$(date -d +1day +%Y-%m-%d)
    Exp1=$(curl -sS https://raw.githubusercontent.com/LT-BACKEND/REGISTER/main/IPVPS | grep $MYIP | awk '{print $3}')
    if [[ $today < $Exp1 ]]; then
echo -e "verifikasi IP di terima"
    else
echo -e "\e[31manda di tolak!\e[0m"
    exit 
fi
}

if [ ! -e /tmp/trojan ]; then
  mkdir -p /tmp/trojan
fi

if [ ! -e /tmp/vmess ]; then
  mkdir -p /tmp/vmess
fi

if [ ! -e /tmp/vless ]; then
  mkdir -p /tmp/vless
fi

IZIN=$(curl -sS https://raw.githubusercontent.com/LT-BACKEND/REGISTER/main/IPVPS | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo "status akun masih aktif" 
CEKEXPIRED 
else
echo -e "\e[31mSCRIPT ANDA EXPIRED!\e[0m"
exit 0
fi
# status
rm -rf /root/status
wget -q -O /root/status "https://raw.githubusercontent.com/LT-BACKEND/stunnelvpn/momok/statushariini" 

today=`date -d "0 days" +"%Y-%m-%d"`
Exp2=$(curl -sS https://raw.githubusercontent.com/LT-BACKEND/REGISTER/main/IPVPS | grep $MYIP | awk '{print $3}')
if [ "$Exp2" == "lifetime" ]; then
    Exp2="2099-12-09"
fi
# CERTIFICATE STATUS
d1=$(date -d "$Exp2" +%s)
d2=$(date -d "$today" +%s)
left=$(((d1 - d2) / 86400))


 
rm cybervpn.zip
rm -rf cybervpn.zip

datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 \e[0m Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}

systemctl restart fail2ban

# // Root Checking
if [ "${EUID}" -ne 0 ]; then
                echo -e "${EROR} Please Run This Script As Root User !"
                exit 1
fi
tomem="$(free | awk '{print $2}' | head -2 | tail -n 1 )"
usmem="$(free | awk '{print $3}' | head -2 | tail -n 1 )"
cpu1="$(mpstat | awk '{print $4}' | head -4 |tail -n 1)"
cpu2="$(mpstat | awk '{print $6}' | head -4 |tail -n 1)"

#update
wget -q -O updatsc.sh "https://raw.githubusercontent.com/LT-BACKEND/stunnelvpn/momok/menu/updateyes.sh" && chmod +x updatsc.sh && ./updatsc.sh 

# // Exporting IP Address
export MYIP=$( curl -s https://ipinfo.io/ip/ )
Name=$(curl -sS https://raw.githubusercontent.com/LT-BACKEND/REGISTER/main/IPVPS | grep $MYIP | awk '{print $2}')
Exp=$(curl -sS https://raw.githubusercontent.com/LT-BACKEND/REGISTER/main/IPVPS | grep $MYIP | awk '{print $3}')

# // nginx
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="✅ ok"
else
    status_nginx="❌ died"
fi
# // 
xray=$( systemctl status xray | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $xray == "running" ]]; then
    status_xray="✅ ok"
else
    status_xray="❌ died"
fi

# // SSH Websocket Proxy
ssh=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $xray == "running" ]]; then
    status_ssh="✅ ok"
else
    status_ssh="❌ died"
fi

## // ddos
dos=$( systemctl status ddos | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $dos == "running" ]]; then
    status_dos="✅ ok"
else
    status_dos="❌ died"
fi


## // fail2ban
fail2ban=$( systemctl status fail2ban | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $fail2ban == "running" ]]; then
    status_fail2ban="✅ ok"
else
    status_fail2ban="❌ died"
fi


## // net
netfilter=$( systemctl status netfilter-persistent | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $netfilter == "exited" ]]; then
    status_net="✅ ok"
else
    status_net="❌ died"
fi




clear
ttoday="$(vnstat | grep today | awk '{print $8" "substr ($9, 1, 3)}' | head -1)"
tmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $8" "substr ($9, 1 ,3)}' | head -1)"
bot
clear
echo -e "\e[33;1m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m\e[0m"
echo -e "\e[33;1m| \E[44;1;39m    °LUNATIC TUNNELING SCRIPTED VPN°        \E[0m|"
echo -e "\e[33;1m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m\e[0m"
echo -e "• Server Uptime       = $( uptime -p  | cut -d " " -f 2-10000 ) "
echo -e "• Current Time        = $( date -d "0 days" +"%d-%m-%Y | %X" )"
echo -e "• Current Domain      = $( cat /etc/xray/domain )"
echo -e "• Server IP           = $MYIP"
echo -e "• ISP                 = $(curl -s ipinfo.io/org | cut -d " " -f 2-10 )\e[0m"
echo -e "• Status Hari ini     = $(cat /root/status)\e[0m"
echo -e "\e[33;1m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m\e[0m"
echo -e "\e[33;1m┌──────────────────────────────────────────────────┐\e[0m"
echo -e " \e[34;1m• Today\e[0m  : [$ttoday] \e[34;1m• Monthly\e[0m: [$tmon]"
echo -e "\e[33;1m└──────────────────────────────────────────────────┘\e[0m"
echo -e "\e[33;1m┌──────────────────────────────────────────────────┐\e[0m"
echo -e "             \e[34;1m SSH WebSocket\e[0m: ${status_ssh}"
echo -e "             \e[34;1m XRAY\e[0m         : ${status_xray}"
echo -e "             \e[34;1m NGINX \e[0m       : ${status_nginx}"
echo -e "             \e[34;1m Firewall \e[0m    : ${status_net}"
echo -e "             \e[34;1m Fail2ban \e[0m    : ${status_fail2ban}"
echo -e "             \e[34;1m iptables \e[0m    : ${status_net}"
echo -e "             \e[34;1m Anti DDoS \e[0m   : ${status_dos}"
echo -e "\e[33;1m└──────────────────────────────────────────────────┘\e[0m"
echo -e "\e[33;1m┌──────────────────────────────────────────────────┐\e[0m"
echo -e "\e[33;1m│  \033[0m ${BOLD}\e[34;1mSSH     VMESS     VLESS   TROJAN   SHADOWSOCKS\e[0m  $COLOR1"
echo -e "\e[33;1m│  \033[0m ${Blue} $ssh1        $vma         $vla       $tra           $ssa   \e[0m"
echo -e "\e[33;1m└──────────────────────────────────────────────────┘\e[0m"
echo -e "\e[33;1m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "\E[39;1;92m                ⇱ MENU SERVICE ⇲                \E[0m"
echo -e "\e[33;1m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "\e[33;1m┌──────────────────────────────────────────────────┐\e[0m"
echo -e " ${CYAN}[${BIWhite}01${BICyan}]${RED} •\e[0m ${CYAN}SSH/CLOUDFRONT  \e[0m  ${CYAN}[${BIWhite}06${BICyan}]${RED} • \e[0m${CYAN}TROJAN MENU\e[0m"
echo -e " ${CYAN}[${BIWhite}02${BICyan}]${RED} •\e[0m ${CYAN}SSH UDP MENU    \e[0m  ${CYAN}[${BIWhite}07${BICyan}]${RED} • \e[0m${CYAN}IPSEC L2TP & PPTP \e[0m"
echo -e " ${CYAN}[${BIWhite}03${BICyan}]${RED} •\e[0m ${CYAN}VMESS MENU      \e[0m  ${CYAN}[${BIWhite}08${BICyan}]${RED} • \e[0m${CYAN}INFO RUNNING \e[0m"
echo -e " ${CYAN}[${BIWhite}04${BICyan}]${RED} •\e[0m ${CYAN}VLESS MENU      \e[0m  ${CYAN}[${BIWhite}09${BICyan}]${RED} • \e[0m${CYAN}TRIAL GENERATOR \e[0m"
echo -e " ${CYAN}[${BIWhite}05${BICyan}]${RED} •\e[0m ${CYAN}S-SOCK MENU     \e[0m  ${CYAN}[${BIWhite}10${BICyan}]${RED} • \e[0m${CYAN}DDOS PROTECTION \e[0m" 
echo -e "\e[33;1m└──────────────────────────────────────────────────┘\e[0m"
echo -e "\e[33;1m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "\e[33;1m|\E[44;1;39m               Silahkan Ketik Menu                 \E[0m|"
echo -e "\e[33;1m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "\e[33;1m┌──────────────────────────────────────────────────┐\e[0m"
echo -e "\e[33;1m│ ${BOLD}${LIGHT}Client    = $Name                            \e[0m"
echo -e "\e[33;1m│ ${BOLD}${LIGHT}Expired   = $Exp                             \e[0m"
echo -e "\e[33;1m│ ${BOLD}${LIGHT}remaining = \e[34;1m$left Days              \e[0m"
echo -e "\e[33;1m│ ${BOLD}${LIGHT}Developer = LUNATIC BACKEND                  \e[0m"
echo -e "\e[33;1m│ ${BOLD}${LIGHT}Version   = 7-44-7 LIbev.                    \e[0m"
echo -e "\e[33;1m└──────────────────────────────────────────────────┘\e[0m"




