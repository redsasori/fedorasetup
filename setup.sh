#!/bin/bash

#ScriptBy
sudo dnf -y install figlet
scriptby=$(figlet "Script by NSM")
echo "$scriptby"

# Make shell scripts executable
chmod +x *.sh

while true; do
    echo -e "\n1) Desktop Setup(Must Use)"
    echo -e "\n2) Gpu Driver Install"
    echo -e "\n3) Auto-cpufreq (Battery Saving utility for laptops)"
    echo -e "\n4) Install Gaming stuff"
    echo -e "\n5) To exit the script \n"

    read -p "Enter Your Choice : " uchoice

    case "$uchoice" in
        1)
            echo -e "\nDoing Setup for You"
            sh desktop.sh
            ;;
        2)
            echo -e "\nInstalling GPU drivers for You"
            sh gpu_drivers.sh
            ;;
        3)
            echo -e "\nInstalling auto-cpufreq"
            sh autocpufreq.sh
            ;;
        4)
            echo -e "\nInstalling Gaming Stuff"
            sh gaming.sh
            ;;
        5)
            echo -e "\nExiting the Script"
            break
            ;;
        *)
            echo -e "\nEnter a valid choice"
            ;;
    esac
done
