import os
os.system('sudo dnf install -y python3-pip')
os.system('pip install pyfiglet')

import pyfiglet
  
result = pyfiglet.figlet_format("Script by NSM")
print(result)

PL1=("Applying Best Config for DNF --> /etc/dnf.conf ")
print(PL1)

#os.system('sudo cp -a dnf.conf /etc/dnf/dnf.conf')

while True:
    
    print("1) Desktop Setup")
    print("2) Laptop Setup")
    print("3) Install Gaming stuff")
    print("4) AMD mesa-git")
    print("5) Intel HW codecs")
    print("type EXIT to to exit the script")

    uchoice= input("Enter Your Choice")
    
    
    if uchoice=="exit" or "EXIT" :
        print("Exiting the Script")
        break

    if uchoice==1:
        print("Doing Setup for Your PC")

    elif uchoice==2:
        print("Doing Setup for Laptop")

    elif uchoice==3:
        print("Installig Gamerboi Stuff")

    elif uchoice==4:
        print("Installing mesa-git")

    elif uchoice==5:
        print("Intel hw codecs")

    else:
        print("Enter a valid choice")
