#!/bin/bash
# conjob als root ausführen

echo "-----------------------------------------------------------------------"
echo " _____ _ _      ____                   _               _               "
echo "|  ___(_) | ___/ ___| _   _ _ __   ___| |__   ___  ___(_)_______ _ __  "
echo "| |_  | | |/ _ \___ \| | | | '_ \ / __| '_ \ / _ \/ __| |_  / _ \ '__| "
echo "|  _| | | |  __/___) | |_| | | | | (__| | | |  __/\__ \ |/ /  __/ |    "
echo "|_|   |_|_|\___|____/ \__, |_| |_|\___|_| |_|\___||___/_/___\___|_|    "
echo "                      |___/                                            "
echo "-----------------------------------------------------------------------"
echo "------------  FileSynchesizer, Copyright (c) 2020    ------------------"
echo "------------  Version 0.1 (Probatum)                 ------------------"
echo "------------                       Rainer Schmitz    ------------------"
echo "------------                   All right reserved.   ------------------"
echo "-----------------------------------------------------------------------"
echo "------------  This program is licensed under the GNU ------------------"
echo "------------  General Public License.                ------------------"
echo "------------  FileSynchesizer comes wiht ABSOLUTELY  ------------------" 
echo "------------  NO WARRENTY, to the extent permitted   ------------------"
echo "------------  by applicable law.                     ------------------"
echo "-----------------------------------------------------------------------"

sync1_conf=$PWD/sync1.conf
if [ -f "$sync1_conf" ]; then
    echo "WARNUNG! SOLLTEN SIE NIX EINGEBN WERDEN DIE ZULETZT GENUTZEN DATEIN GENUTZT!"
else 
	echo "Bitte Geben Sie die erste Datei und Pfad an der Synconiert werden soll"
    #read sync1
fi

sync1_conf=$PWD/sync2.conf
if [ -f "$sync2_conf" ]; then
    echo "WARNUNG! SOLLTEN SIE NIX EINGEBN WERDEN DIE ZULETZT GENUTZEN DATEIN GENUTZT!"
else 
	echo "Bitte Geben Sie die zweite Datei und Pfad an der Synconiert werden soll"
    #read $sync2
fi

#echo "Bitte Geben Sie die erste Datei und Pfad an der Synconiert werden soll"
#read sync1
#echo "Bitte Geben Sie die zweite Datei und Pfad an der Synconiert werden soll"
#read sync2

sync1="/media/unixben/San32/Datenbank.kdbx"
#> $sync1 sync2_temp.conf
md5check1=$(set -- $(md5sum $sync1); echo $1)

sync2="/mnt/freeNAS/Datenbank.kdbx"
# $sync2 sync2_temp.conf
md5check2=$(set -- $(md5sum $sync2); echo $1)

if [ "$md5check1" = "$md5check2" ]; then
    echo "Die files sind Syncon"
else
    echo "Die files sind nicht Syncor"
    echo "Sollen Sie Synconiert werden? (j/n)"
    read  response2
fi

if [ "$response2" == "j" ]; then
    cp "$sync1" "$sync2"
fi


