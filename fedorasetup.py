import os
os.system('sudo dnf install python3-pip')
os.system('sudo pip install pyfiglet')
os.system('chmod +x *.sh')
import pyfiglet

result = pyfiglet.figlet_format("Script by NSM")
print(result)

while True:

    print("\n1) Desktop Setup AMD GPU")
    print("\n2) Desktop Setup Intel")
    print("\n3) Auto-cpufreq(Battery Saving utility for laptops)")
    print("\n4) Install Gaming stuff")
    print("\n5) To exit the script \n")

    uchoice=int(input("Enter Your Choice : "))

    if uchoice==1:
        print("\nDoing Setup for You")
        os.system("sh desktopamd.sh")

    elif uchoice==2:
        print("\nDoing Setup for You")
        os.system("sh desktopintel.sh")

    elif uchoice==3:
        print("\nInstalling auto-cpufreq")
        os.system("sh autocpufreq.sh")

    elif uchoice==4:
        print("\nInstalling Gaming Stuff")
        os.system("sh gaming.sh")

    elif uchoice==5:
        print("\nExiting the Script")
        break

    else:
        print("\nEnter a valid choice")
