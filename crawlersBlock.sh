#!/bin/bash

#Mettre en backup les donnees d'access_log
cp --backup /var/log/apache2/access.log

#verificatio de chaque log qui utilise des cron
cd /var/log/apache2/

cat access.log
do crontab -l; 
#Recuperation de tous les adresses clients qui renvoye des codes 404(c'est à dire qui ont rencontré des scrawlers)(
do

#Script du bloquage de scrawlers:
awk '($9 ~ /404/)' /var/log/apache2/access.log | awk '{print $9,$7}' | sort | sed -n '/404$/p'|\ awk '{print $1} |tail -f |iptables -A INPUT -s $1 -j DROP  ;
done
