#log_file
log_file="/tmp/desktopintel.log"
exec > >(tee -a "$log_file") 2>&1

#figletfig_echo
fig_echo() {
    message="$1"
    figlet "$message"
}

scriptby=$(figlet "Script by NSM")
fig_echo "$scriptby"

#dnfconfig
fig_echo 'Making some necessary changes in dnf config'
sudo cp -a dnf.conf /etc/dnf/dnf.conf

#Selinux_Permmisive
sudo cp -a config /etc/selinux/config

#update
fig_echo 'Updating the system'
sudo dnf --refresh upgrade;

#RPMFUSION
fig_echo 'Installing free & nonfree rpmfusion'
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#Codecs
fig_echo 'Installing Necessary Codecs'
sudo dnf swap ffmpeg-free ffmpeg --allowerasing;
sudo dnf groupupdate multimedia sound-and-video;

#Tainted_Codecs
sudo dnf install -y rpmfusion-nonfree-release-tainted
sudo dnf --repo=rpmfusion-nonfree-tainted install "*-firmware"

#Dragora
fig_echo  'Installing Dragora'
sudo dnf install -y dnfdragora;

#Flatpak
fig_echo 'Installing Flatpak'
sudo dnf install flatpak;
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#Flatseal
fig_echo 'Installing Flatseal'
sudo dnf install -y flatseal;

#Tg
fig_echo 'Installing Telegram Desktop'
flatpak install flathub org.telegram.desktop

#Codium
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg;
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo;
sudo dnf install -y codium;

#AppImageLauncher
wget https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm
sudo rpm -i appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm

#OnlyOffice
fig_echo 'Removing LibreOffice'
sudo dnf remove libreoffice*
fig_echo 'Downloading Onlyoffice'
wget https://github.com/ONLYOFFICE/appimage-desktopeditors/releases/download/v7.3.3/DesktopEditors-x86_64.AppImage && chmod +x DesktopEditors-x86_64.AppImage;

#Obsidian
fig_echo 'Getting Obsidian for ya'
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.2.8/Obsidian-1.2.8.AppImage && sudo chmod +x Obsidian-1.2.8.AppImage;

mv -a *.AppImage /home/$USER/Applications

#Alacritty
fig_echo 'Downloading the Best terminal alacritty' 
sudo dnf install -y alacritty;

#Fetch
fig_echo 'Wanna fetch i gotchu Installing fastfetch'
sudo dnf install -y fastfetch;

#QEMU
fig_echo 'Installing QEMU'

sudo dnf install -y qemu-kvm libvirt virt-install bridge-utils virt-manager libvirt-devel virt-top libguestfs-tools guestfs-tools && sudo systemctl start libvirtd && sudo systemctl enable libvirtd;

#Spotify
fig_echo 'Installing Spotiy'
flatpak install flathub com.spotify.Client

#small_apps
fig_echo 'Installing few handy apps'
sudo dnf install -y okular mpv;
sudo dnf install -y gnome-tweaks;

#corectrl
fig_echo 'Installing CoreCtrl'
sudo dnf install corectrl;

sync;


