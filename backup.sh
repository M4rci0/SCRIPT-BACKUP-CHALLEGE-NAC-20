#!/bin/bash
#DIRETORIOS - declarando variaveis
DIR_ORIG_CENTOS="/etc/httpd/"
DIR_ORIG_UBUNTU="/etc/apache2/"
DIR_SITES="/var/www"
DIR_DEST="/backups/"
DATA=`date +%d-%m_%H%M`
BKP_APACHE_CONF=conf-apache_$DATA.tgz
BKP_APACHE_WWW=site-apache_$DATA.tgz
COMANDO="$1"
CRONJOB="0 5 * * * /backups/.backup.sh"

if [[ -z "$1" ]];then
	echo "Digite ./backup.sh backup para fazer backup e ./backup.sh restore para restaurar o ultimo backup. Utilize ./backup.sh crontab para adicionar script no contrab"
fi
#Declarando o que o comando restore ira fazer a restauracao e gerando log
if [[ $COMANDO == restaure ]];  then
	DIR_DEST_CONF=$(ls /backups/conf-apache_*.tgz | tail -n 1)
	DIR_DEST_WWW_CONF=$(ls /backups/site-apache_*.tgz | tail -n 1)
	echo "Iniciando restaure em $DATA" >> $DIR_DEST/restaure.txt
	/bin/tar -xpzf $DIR_DEST_CONF -C / >> $DIR_DEST/restaure.txt
	/bin/tar -xpzf $DIR_DEST_WWWW -C / >> $DIR_DEST/restaure.txt
fi
#Declarando o que o comando backup ira fazer o backup e gerar um log 
if [[ $COMANDO == backup ]]; then
	if [[ -n "$(uname -a | grep Debian)" ]]; then
		echo "Iniciando backup em $DATA" >> $DIR_DEST/backup.txt
		tar -czpf ${DIR_DEST}${BKP_APACHE_CONF} ${DIR_ORIG_UBUNTU} >> $DIR_DEST/backup.txt
		tar -czpf ${DIR_DEST}${BKP_APACHE_WWW} ${DIR_SITES} >> $DIR_DEST/backup.txt
	elif [[-n "$(cat /etc/os-release | grep rhell)" ]]; then
		echo "Iniciado backup em $DATA" >> $DIR_DEST/backup.txt
		tar -czpf ${DIR_DEST}${BKP_APACHE_CONF} ${DIR_ORIG_CENTOS}>>$DIR_DEST/backup.txt
		tar -czpf ${DIR_DEST}${BKP_APACHE_WWW} ${DIR_SITES} >> $DIR_DEST/backup.txt
	else
		echo "script feito para centos/rhel/ubuntu/debian"
		exit 1
	fi
fi 
#Declarando que o script ira rodar automaticamente
if [[ $COMANDO == crontab ]]; then
	cp backup.sh /backups/
	chmod +x /backups/backup.sh
	(crontab -u root -l; echo"CRONJOB") | crontab -u root -
fi





		
