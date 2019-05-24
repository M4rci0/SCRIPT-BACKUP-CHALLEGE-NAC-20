# Script Shell Challenger NAC20

## Introduction

> Nesse desafio realizamos a criação de um script shell para realizar backup de uma solução web server. 

## Code Samples

>Realizando configuração de backup e log 

>if [[ $COMANDO == backup ]];  then
    if [[ -n "$(uname -a | grep Debian)" ]]; then
        echo "Iniciando backup em $DATA" >> $DIR_DEST/backup.txt
        tar -czpf ${DIR_DEST}${BKP_APACHE_CONF} ${DIR_ORIG_UBUNTU} >> $DIR_DEST/backup.txt
        tar -czpf ${DIR_DEST}${BKP_APACHE_WWW} ${DIR_SITES} >> $DIR_DEST/backup.txt
    elif [[ -n "$(cat /etc/os-release | grep rhel)" ]]; then
        echo "Iniciando backup em $DATA" >> $DIR_DEST/backup.txt
        tar -czpf ${DIR_DEST}${BKP_APACHE_CONF} ${DIR_ORIG_CENTOS} >> $DIR_DEST/backup.txt
        tar -czpf ${DIR_DEST}${BKP_APACHE_WWW} ${DIR_SITES} >> $DIR_DEST/backup.txt
    else
        echo "script feito para centos/rhel/ubuntu/debian"
        exit 1
    fi
fi

## Installation

> The installation instructions are low priority in the readme and should come at the bottom. The first part answers all their objections and now that they want to use it, show them how.
