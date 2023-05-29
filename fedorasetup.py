import os
import subprocess

os.system('sudo dnf install -y python3-pip')
os.system('pip install pyfiglet')

import pyfiglet

result = pyfiglet.figlet_format("Script by NSM")
print(result)

print("\n1) Desktop Setup AMD GPU")
print("\n2) Desktop Setup Intel")
print("\n3) Auto-cpufreq(Battery Saving utility for laptops)")
print("\n4) Install Gaming stuff")
print("\n5) To exit the script \n")


while True:

    if uchoice==1:
        print("\nDoing Setup for You")
        subprocess.call("./desktopamd.sh")

    elif uchoice==2:
        print("\nDoing Setup for You")
        subprocess.call("./desktopintel.sh")

    elif uchoice==3:
        print("\nInstalling auto-cpufreq")
        subprocess.call("./autocpufreq.sh")

    elif uchoice==4:
        print("\nInstalling Gaming Stuff")
        subprocess.call("./gaming.sh")

    elif uchoice==5:
        print("\nExiting the Script")
        break

    else:
        print("\nEnter a valid choice")
