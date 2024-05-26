#!/bin/bash


LocalVersion=$(cat /etc/version)
version=$(curl -sS "https://raw.githubusercontent.com/LT-BACKEND/stunnelvpn/momok/versiupdate")

if [ "$LocalVersion" = "$version" ]; then
  echo
else
  clear
  figlet -f 3d "Lunatic" | lolcat
  echo "Update tersedia!!" | lolcat
  echo "Fix Menu" | lolcat

  spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
      local temp=${spinstr#?}
      printf " [%c] " "$spinstr"
      local spinstr=$temp${spinstr%"$temp"}
      sleep $delay
      printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
  }

  loading_animation() {
    local message=$1
    echo -n "$message"
    $2 &
    spinner $!
  }

  echo "Sedang mengupdate!!!"

  loading_animation "Loading" "sleep 5"

  fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
      [[ -e $HOME/fim ]] && rm $HOME/fim
      ${CMD[0]} -y >/dev/null 2>&1
      ${CMD[1]} -y >/dev/null 2>&1
      touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    while true; do
      for ((i = 0; i < 18; i++)); do
        echo -ne "\033[0;32m#"
        sleep 0.1s
      done
      [[ -e $HOME/fim ]] && rm $HOME/fim && break
      echo -e "\033[0;33m]"
      sleep 1s
      tput cuu1
      tput dl1
      echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
  }
  fun_bar

  # Hapus semua file sebelum mengunduh versi baru
  rm -f /etc/version
  rm -f /usr/bin/menu
  rm -f /usr/bin/dashboard
  rm -f /usr/bin/setting
  rm -f /usr/bin/udp
  rm -f /usr/bin/menush
  rm -f /usr/bin/menu-ssh
  rm -f /usr/bin/menu-vmess
  rm -f /usr/bin/menu-vless
  rm -f /usr/bin/menu-trojan
  rm -f /usr/bin/restart
  rm -f /usr/bin/running
  # Tambahkan perintah rm untuk file lainnya...
wget -q -O /etc/version "https://raw.githubusercontent.com/LT-BACKEND/stunnelvpn/momok/versiupdate" && chmod +x /etc/version
# // Menu System
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/LT-BACKEND/stunnelvpn/momok/menu/menu.sh" && chmod 777 /usr/bin/menu
wget -q -O /usr/bin/dashboard "https://raw.githubusercontent.com/LT-BACKEND/stunnelvpn/momok/menu/dashboard.sh" && chmod 777 /usr/bin/dashboard
wget -q -O /usr/bin/setting "https://raw.githubusercontent.com/LT-BACKEND/stunnelvpn/momok/Themes/setting.sh" && chmod 777 /usr/bin/setting
# // Menu Protocol
wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/LT-BACKEND/stunnelvpn/momok/menu/menu-ssh.sh" && chmod 777 /usr/bin/menu-ssh
wget -q -O /usr/bin/menu-vless "https://raw.githubusercontent.com/LT-BACKEND/stunnelvpn/momok/menu/menu-vless.sh" && chmod 777 /usr/bin/menu-vless
wget -q -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/LT-BACKEND/stunnelvpn/momok/menu/menu-vmess.sh" && chmod 777 /usr/bin/menu-vmess
wget -q -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/LT-BACKEND/stunnelvpn/momok/menu/menu-trojan.sh" && chmod 777 /usr/bin/menu-trojan
wget -q -O /usr/bin/udp "https://raw.githubusercontent.com/LT-BACKEND/stunnelvpn/momok/menu/menush.sh" && chmod 777 /usr/bin/udp
# // Running Restart
wget -q -O /usr/bin/running "https://raw.githubusercontent.com/LT-BACKEND/stunnelvpn/momok/menu/running.sh" && chmod 777 /usr/bin/running
wget -q -O /usr/bin/restart "https://raw.githubusercontent.com/LT-BACKEND/stunnelvpn/momok/menu/restart.sh" && chmod 777 /usr/bin/restart
fi
