#!/bin/bash
# Script for displaying system information. 
# Created by Curtis Ferguson. October 7th 2026.
# Abit of aid with Claude.

#Welcome Banner
echo
echo "       #########################"
echo -e "       |  \e[1mSystem Information\e[5m_\e[0m  |"
echo -e "       |              \e[3mby Cferg\e[0m |"
echo "       #########################"

#################
#### NETWORK ####
#################

Network_Info() {
    
local RED='\033[0;31m' GREEN='\033[0;32m' YELLOW='\033[0;33m' NC='\033[0m'
local VPN_RE='^(proton|wg|tun)'
local route dev local_ip dev6 public_ip

route=$(ip route get 1.1.1.1 2>/dev/null)
dev=$(awk '{for(i=1;i<NF;i++) if($i=="dev") print $(i+1)}' <<<"$route")
local_ip=$(awk '{for(i=1;i<NF;i++) if($i=="src") print $(i+1)}' <<<"$route")
dev6=$(ip -6 route get 2606:4700:4700::1111 2>/dev/null | awk '{for(i=1;i<NF;i++) if($i=="dev") print $(i+1)}')
gateway=$(ip route | awk '/^default/ {print $3}')

public_ip=$(curl -4 -s --max-time 4 https://icanhazip.com)
[[ $public_ip =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]] || public_ip=""

echo
echo -e "  \e[1m---NETWORK---\e[0m"
echo " |- HOST: $HOSTNAME"
echo " |- Local IP Address: ${local_ip:-unknown}"
echo " |- Public IP Address: ${public_ip:-unreachable}"
echo " |- Gateway: $gateway"

#Loop for VPN
if [[ $dev =~ $VPN_RE ]]; then
    echo -e " |- VPN: ${GREEN}Connected${NC} ($dev)"
else
    echo -e " |- VPN: ${RED}Disconnected${NC} (${dev:-no route})"
fi

if [[ -n $dev6 && ! $dev6 =~ $VPN_RE ]]; then
    echo -e " |- ${YELLOW}IPv6 leak: routed via $dev6${NC}"
fi

}

################
#### SYSTEM ####
################

System_Info() {


WHOAMI=$(whoami)
UPTIME=$(uptime -p)
PKG=$(rpm -qa | wc -l)
CPU=$(lscpu | awk -F': *' '/Model name/{print $2}')
CORES=$(lscpu | awk -F: '/Core\(s\) per socket/ {gsub(/ /,"",$2); print $2}')
UNAME=$(uname -r)
OS=$(source /etc/os-release && echo "$PRETTY_NAME")
mapfile -t GPUS < <(lspci | grep -E 'VGA|3D|Display' | sed 's/^[^:]*:[^:]*: //')

echo
echo -e "  \e[1m---SYSTEM---\e[0m"

echo " |- User: $WHOAMI"
echo " |- Shell: $SHELL"
echo " |- Uptime: $UPTIME"
echo " |- Packages: $PKG"
echo " |- CPU: $CPU"
echo " |- Core Count: $CORES"
#GPU1 & GPU2
for i in "${!GPUS[@]}"; do
        echo " |- GPU$((i+1)): ${GPUS[$i]}"
    done
echo " |- Kernel: $UNAME"
echo " |- OS: $OS"

}

#####################
#### DIAGNOSTICS ####
#####################

Diagnostic_Info() {

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
RAM=$(free -m | awk 'NR==2 {printf "%.1f", $3/1024}')
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')

echo
echo -e "  \e[1m---DIAGNOSTICS---\e[0m"

#RAM CHECK
if [ "${RAM%.*}" -gt 25 ];

then

echo -e " |- Memory Used: ${RED}$RAM${NC} GB - High Ram Usage"

else 

echo -e " |- Memory Used: ${GREEN}$RAM${NC} GB"

fi 
#########

echo " |- CPU Used: $CPU_USAGE"

}

while true; do
    echo
    echo " Please Select the Type of System Information..."
    echo

    read -rp " Show (n)etwork, (s)ystem, (d)iagnostics, or (a)ll?:  " choice

    case "$choice" in
        n|N) Network_Info ;;
        s|S) System_Info ;;
        d|D) Diagnostic_Info ;;
        a|A) Network_Info; System_Info; Diagnostic_Info ;;
        *) echo " Invalid option" ;;
    esac

    echo
    read -rp " Reselect? (y)es, (n)o: " again
    [[ $again =~ ^[yY]$ ]] || break
done
