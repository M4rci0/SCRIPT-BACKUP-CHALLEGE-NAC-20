# Script Shell Challenger NAC20

## Introdução

> Nesse desafio realizamos a criação de um script shell para realizar backup de uma solução web server. 

## Objetivo 
>O objetivo desse script é realizar o backup das pastas "/etc/httpd/" ou "/etc/apache2" e armazenar o backup dessas pastas de forma compactada e enviar para a para a pasta "/backup/" para assim realizamos a restauração da maquina, tambem foi utilizado um crontab para realizar essa tarefa de forma automatica.

## Funcionamento
>Para realizar o backup digite ./backup.sh backup que ira realizar o backup das pastas e caso as pastas sejam apagadas ou tenham algum problema efutar o comando ./backup.sh restaure para restaurar a ultima versão do backup.
Para adicionar o script no crontab digite ./backup.sh crontab e ira fazer com que a tarefa seja efetuada automaticamente. 
>
## Observação 
>O script foi feito para rodar em CentOS/Debian/Rhel/Ubuntu


