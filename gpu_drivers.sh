#!/bin/bash

#AMD GPU drivers
install_amd_drivers() {
    echo "AMD GPU Driver is already Installed"
    echo "Now Installing CoreCtrl"
    sudo dnf install corectrl;
   
}

#NVIDIA GPU drivers
install_nvidia_drivers() {
    echo "Installing NVIDIA GPU drivers..."
    sudo dnf install akmod-nvidia sudo dnf install xorg-x11-drv-nvidia-390xx akmod-nvidia-390xx sudo dnf install xorg-x11-drv-nvidia-340xx akmod-nvidia-340xx
    echo "NVIDIA GPU drivers installed successfully."
}

#Intel GPU drivers
install_intel_drivers() {
    echo "Installing Intel GPU drivers..."
    sudo dnf install libva-intel-driver
    echo "Intel GPU drivers installed successfully."
}

while true; do
    echo "Choose an option to install GPU drivers on Fedora Linux:"
    echo "1) Install AMD GPU drivers"
    echo "2) Install NVIDIA GPU drivers"
    echo "3) Install Intel GPU drivers"
    echo "4) Quit"
    read -p "Enter your choice (1/2/3/4): " choice

    case $choice in
        1)
            install_amd_drivers
            ;;
        2)
            install_nvidia_drivers
            ;;
        3)
            install_intel_drivers
            ;;
        4)
            echo "Exiting script."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a valid option (1/2/3/4)."
            ;;
    esac
done
