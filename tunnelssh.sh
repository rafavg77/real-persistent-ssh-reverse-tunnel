#!/bin/bash

online="Online"
offline="Offline"

remotePort="2223"
remoteHost="localhost"
remoteUser=""
remoteIP=""
localPort="22"



checarInternet(){
        wget -q --spider http://google.com

        if [ $? -eq 0 ]; then
            echo "Online"
            isAvailable="Online"
        else
            echo "Offline"
            isAvailable="Offline"
        fi
}

createTunnel() {
  /usr/bin/ssh -N -R $remotePort:$remoteHost:$localPort $remoteUser@$remoteIP
  if [[ $? -eq 0 ]]; then
    echo Tunnel to $remoteIP created successfully
  else
    echo An error occurred creating a tunnel to $remoteIP. RC was $?
  fi
}

pidSSH(){
        checarInternet
        if [ "$isAvailable" == "$online" ]
        then
                pgrep -f -x '/usr/bin/ssh -N -R $remotePort:$remoteHost:$localPort $remoteUser@$remoteIP'
                if [[ $? -ne 0 ]]; then
                        echo Creating new tunnel connection
                        createTunnel
                fi
        elif [ "$isAvailable" == "$offline" ]
        then
                kill -9 $(pgrep -f -x '/usr/bin/ssh -N -R $remotePort:$remoteHost:$localPort $remoteUser@$remoteIP')
        fi
}
pidSSH
