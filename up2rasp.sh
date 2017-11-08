#!/bin/bash
# ------------------------------------------------------------------
# [GustavYoung] Update Tool :3
#          Automatization to get all the uxmdf tunnels 
#                 migrated to uxm-cloud 
prompt="Escoge una opcion:"
options=("Migracion Tunel" "Instalar APP Uxmal v2" "Todo Junto" "Actualizar" "Instalar systemd")

echo "$title"
PS3="$prompt "
select opt in "${options[@]}" "Salir"; do 

    case "$REPLY" in

    1 ) echo "Haz seleccionado $opt ejecutara $REPLY"
            # --- processing-------------------------------------------
            #
            #sudo apt-get update && sudo apt-get upgrade -y;
            #otros metodos
            sudo hwclock -r;
            sudo killall rsync && sudo killall rsync && sudo killall rsync && sudo killall rsync;
            sudo killall rsync && sudo killall rsync && sudo killall rsync && sudo killall rsync;
            sudo killall rsync && sudo killall rsync && sudo killall rsync && sudo killall rsync;
            #scp -P 8129 ~/.ssh/id_*.pub user@host:
            #ssh -p 8129 user@host 'cat id_*.pub >> ~/.ssh/authorized_keys'
            #scp -P3113 /home/uslu/.ssh/id_rsa.pub uxmal-ftp@uxm3.uxmalstream.com:/tmp;
            ssh-copy-id -i /home/uslu/.ssh/id_rsa.pub '-p3113 uxmal-ftp@uxm3.uxmalstream.com';
            #scp -P3639 /home/uslu/.ssh/id_rsa.pub uxm-cloud@cloud.uxmalstream.mx:/tmp;
            ssh-copy-id -i /home/uslu/.ssh/id_rsa.pub '-p3639 uxm-cloud@cloud.uxmalstream.mx';
            #
            scp -P3639 uxm-cloud@cloud.uxmalstream.mx:.ssh/id_rsa.pub /tmp && cat /tmp/id_rsa.pub >> /home/uslu/.ssh/authorized_keys;
            #
            scp -P3639 uxm-cloud@cloud.uxmalstream.mx:bktunnel/backtunnel /tmp;
            #
            sudo mv /etc/init.d/backtunnel /tmp/backtunnel.old;
            #
            sudo mv /tmp/backtunnel /etc/init.d/;
            #
            #awk 'FNR==NR&&$1=="TUNNEL_PORT"{x=$4} NR!=FNR{if($1=="TUNNEL_PORT"){$1=x}print}' /tmp/backtunnel.old /etc/init.d/backtunnel;
            #
            tunnel=`grep -oP "TUNNEL_PORT=\K\d+" /tmp/backtunnel.old`;
            #
            sudo sed -i.bak -re "s/(TUNNEL_PORT=)([0-9]+)/TUNNEL_PORT=$tunnel/g" /etc/init.d/backtunnel;
            #
            sudo chown root.root /etc/init.d/backtunnel;
            #
            sudo update-rc.d backtunnel defaults;
            #
            sudo vim /etc/init.d/backtunnel;
            #
            sudo update-rc.d backtunnel defaults;
            #
            sudo rm /home/uslu/gstool/*.self;
            #
            sudo rsync -avh --exclude="*.cfg" --include="*.sh" -e "ssh -i /home/uslu/.ssh/id_rsa -p1260" --size-only --partial --progress uxmdf@ca.uxmalstream.mx:/home/stratil/CLIENTES/desarrollo/gstool/ /home/uslu/gstool/;
            #
            sudo sleep 30 && sudo service backtunnel stop;
            #
            sudo sleep 60 && sudo service backtunnel start;
            #
            sudo sleep 180 && sudo service backtunnel restart;
            #
            sudo sleep 240 && sudo service backtunnel restart;
            #
            sudo sleep 360 && sudo service backtunnel restart;
            #
            #sudo sleep 46000 && sudo reboot;
    ;;
    2 ) echo "Haz seleccionado $opt ejecutara $REPLY"
        sudo npm cache clean -f;
        sudo npm install -g n;
        sudo n latest;
        cd /home/uslu/uxm-upgrade;
        npm install;
        cd;
        cd /home/uslu/uxm-upgrade;
        node uxm-upgrade.js
    ;;
    3 ) echo "Haz seleccionado $opt ejecutara $REPLY"
            echo "Ten en cuenta que el proceso es largo.";
            echo "tienes 5 seg para dar CTRL+C y cancelar el proceso;";
            sleep 6;
            echo "Updating Tunel and all the other Shit";
            # --- processing-------------------------------------------
            #
            #sudo apt-get update && sudo apt-get upgrade -y;
            #otros metodos
            sudo hwclock -r;
            sudo killall rsync && sudo killall rsync && sudo killall rsync && sudo killall rsync;
            sudo killall rsync && sudo killall rsync && sudo killall rsync && sudo killall rsync;
            sudo killall rsync && sudo killall rsync && sudo killall rsync && sudo killall rsync;
            #scp -P 8129 ~/.ssh/id_*.pub user@host:
            #ssh -p 8129 user@host 'cat id_*.pub >> ~/.ssh/authorized_keys'
            #scp -P3113 /home/uslu/.ssh/id_rsa.pub uxmal-ftp@uxm3.uxmalstream.com:/tmp;
            ssh-copy-id -i /home/uslu/.ssh/id_rsa.pub '-p3113 uxmal-ftp@uxm3.uxmalstream.com';
            #scp -P3639 /home/uslu/.ssh/id_rsa.pub uxm-cloud@cloud.uxmalstream.mx:/tmp;
            ssh-copy-id -i /home/uslu/.ssh/id_rsa.pub '-p3639 uxm-cloud@cloud.uxmalstream.mx';
            #
            scp -P3639 uxm-cloud@cloud.uxmalstream.mx:.ssh/id_rsa.pub /tmp && cat /tmp/id_rsa.pub >> /home/uslu/.ssh/authorized_keys;
            #
            scp -P3639 uxm-cloud@cloud.uxmalstream.mx:bktunnel/backtunnel /tmp;
            #
            sudo mv /etc/init.d/backtunnel /tmp/backtunnel.old;
            #
            sudo mv /tmp/backtunnel /etc/init.d/;
            #
            #awk 'FNR==NR&&$1=="TUNNEL_PORT"{x=$4} NR!=FNR{if($1=="TUNNEL_PORT"){$1=x}print}' /tmp/backtunnel.old /etc/init.d/backtunnel;
            #
            tunnel=`grep -oP "TUNNEL_PORT=\K\d+" /tmp/backtunnel.old`;
            #
            sudo sed -i.bak -re "s/(TUNNEL_PORT=)([0-9]+)/TUNNEL_PORT=$tunnel/g" /etc/init.d/backtunnel;
            #
            sudo chown root.root /etc/init.d/backtunnel;
            #
            sudo update-rc.d backtunnel defaults;
            #
            sudo vim /etc/init.d/backtunnel;
            #
            sudo update-rc.d backtunnel defaults;
            #
            sudo rm /home/uslu/gstool/*.self;
            #
            sudo rsync -avh --exclude="*.cfg" --include="*.sh" -e "ssh -i /home/uslu/.ssh/id_rsa -p1260" --size-only --partial --progress uxmdf@ca.uxmalstream.mx:/home/stratil/CLIENTES/desarrollo/gstool/ /home/uslu/gstool/;
            #
            sudo sleep 30 && sudo service backtunnel stop;
            #
            sudo sleep 60 && sudo service backtunnel start;
            #
            sudo sleep 90 && sudo service backtunnel restart;
            #
            sudo sleep 180 && sudo service backtunnel restart;
            #
            echo "Aqui empieza lo de la app";
            sudo npm cache clean -f;
            sudo npm install -g n;
            sudo n latest;
            cd /home/uslu/uxm-upgrade;
            npm install;
            cd;
            cd /home/uslu/uxm-upgrade;
            node uxm-upgrade.js;
            #break
            echo " 1) Migracion Tunel" 
            echo " 2) Instalar APP Uxmal v2" 
            echo " 3) Todo Junto" 
            echo " 4) Actualizar" 
            echo " 5) Instalar systemd"
    ;;
    4 ) echo "Actualizar sistema de la rasp."
            echo "Actualizando repos";
            sudo apt-get update;
            echo "Instalando packs";
            sudo apt-get upgrade -y;
            clear
            echo " 1) Migracion Tunel" 
            echo " 2) Instalar APP Uxmal v2" 
            echo " 3) Todo Junto" 
            echo " 4) Actualizar" 
            echo " 5) Instalar systemd"
    ;;
    5 ) echo "Instalar systemd."
            echo "Agregando repos de jessie ";
            sudo touch /etc/apt/preferences.d/jessie.pref;
            sudo touch /etc/apt/sources.list.d/jessie.list;
            sudo bash -c "echo 'Package: *' >> /etc/apt/preferences.d/jessie.pref";
            sudo bash -c "echo Pin: release n=jessie >> /etc/apt/preferences.d/jessie.pref";
            sudo bash -c "echo Pin-Priority: 900 >> /etc/apt/preferences.d/jessie.pref";
            echo "pref listo"
            sudo bash -c "echo deb http://mirrordirector.raspbian.org/raspbian/ jessie main contrib non-free rpi >> /etc/apt/sources.list.d/jessie.list";  
            #sudo sed -i '$ a Package: *' /etc/apt/preferences.d/jessie.pref;
            #sudo sed -i '$ a Pin: release n=jessie' /etc/apt/preferences.d/jessie.pref;
            #sudo sed -i '$ a Pin-Priority: 900 ' /etc/apt/preferences.d/jessie.pref;
            #sudo sed -i '$ a deb http://mirrordirector.raspbian.org/raspbian/ jessie main contrib non-free rpi' /etc/apt/sources.list.d/jessie.list;
            echo "Actualizando repos";
            sudo apt-get update;
            echo "Instalando packs";
            sudo apt-get install systemd -t jessie -y;
            sudo apt-get install systemd -y;
            echo "Limpiando Archivos y repo";
            sudo rm /etc/apt/preferences.d/jessie.pref;
            sudo rm /etc/apt/sources.list.d/jessie.list;
            sudo apt-get clean;
            sudo apt-get update;
            clear
            echo " 1) Migracion Tunel" 
            echo " 2) Instalar APP Uxmal v2" 
            echo " 3) Todo Junto" 
            echo " 4) Actualizar" 
            echo " 5) Instalar systemd"
            echo " 6) Salir"
    ;;

    $(( ${#options[@]}+1 )) ) echo "ALV Goodbye!"; break;;
    *) echo "Esa opcion no existe :@!.";continue;;

    esac

done


clear
