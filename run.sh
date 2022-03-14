#!/bin/bash
set -e

if [ $(whoami) == "root" ]; then
    echo "User is root, continuing"
else
    echo "Must run as root user"
    exit 1
fi


# https://stackoverflow.com/questions/38679346/get-public-ip-address-on-current-ec2-instance/38681638
THIS_SERVER_IP=45.77.140.150
#$(dig +short myip.opendns.com @resolver1.opendns.com)

echo "our IP address is: ${THIS_SERVER_IP}"
echo "starting server..."
echo "------------------"

if [[ -z "${DEBUG}" ]]; then
    ./wargame3-server +port 10050 +ip_mms 178.32.126.73 +port_mms 10002 +ip 45.77.140.150 +rcon_password kslw48ajbscilljbnay219 +rcon_port 10060 +chat_log_file chat.txt
else
    echo "run with: r  +port 10050 +ip_mms 178.32.126.73 +port_mms 10002 +ip 45.77.140.150 +rcon_password kslw48ajbscilljbnay219 +rcon_port 10060"
    gdb ./wargame3-server
fi