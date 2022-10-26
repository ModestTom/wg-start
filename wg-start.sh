#!/bin/sh

# Script for easily starting and stopping Wireguard configurations

if [ $EUID = 0 ]; then
  if [[ $(wg show) == interface:* ]]; then
    echo "Wireguard is running $(sudo wg show | grep interface: | tail -c +12) configuration. Would you like to stop it? [y/n]"
    read RESP
    if [ $RESP == 'y' ]; then
      echo "Stopping Wireguard $(sudo wg show | grep interface: | tail -c +12)"
      wg-quick down $(sudo wg show | grep interface: | tail -c +12)
      exit 0;
    else 
      echo "Wireguard $(sudo wg show | grep interface: | tail -c +12) is still running"
      exit 0;
    fi
  else
    confs=('' $(ls /etc/wireguard/ | sed 's/.conf//'))
    echo -e "Which Wireguard configuartion would you like to use? (1, 2, 3...) \n ${confs[@]}"
    read CONF
    echo "Starting Wireguard ${confs[$CONF]}" 
    start=$(wg-quick up ${confs[$CONF]})
    exit 0;
  fi
else 
  echo 'You must run this script as a superuser, "sudo wg-start.sh".'
  exit 0;
fi
