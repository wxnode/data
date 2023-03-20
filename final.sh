#!/bin/bash
#mkdir -p ~/Themes/WhiteSur-kde
#git clone https://github.com/vinceliuice/WhiteSur-kde.git ~/Themes/WhiteSur-kde
#bash ~/Themes/WhiteSur-kde/install.sh

#mkdir -p ~/Themes/McMojave-kde
#git clone https://github.com/vinceliuice/McMojave-kde.git ~/Themes/McMojave-kde
#bash ~/Themes/McMojave-kde/install.sh

#mkdir -p ~/Themes/Qogir-kde
#git clone https://github.com/vinceliuice/Qogir-kde.git ~/Themes/Qogir-kde
#bash ~/Themes/Qogir-kde/install.sh

sudo git clone https://github.com/zsh-users/zsh-autosuggestions /usr/share/oh-my-zsh/custom/plugins/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /usr/share/oh-my-zsh/custom/plugins/zsh-syntax-highlighting

#yay -S --noconfirm materia-kde kvantum-theme-materia

yay -S --noconfirm --nodiffmenu --removemake sddm-sugar-candy-git
#yay -S --noconfirm --nodiffmenu --removemake mcmojave-kde-theme-git
yay -S --noconfirm --nodiffmenu --removemake whitesur-kde-theme-git
yay -S --noconfirm --nodiffmenu --removemake chromeos-kde-theme-git
#yay -S --noconfirm --nodiffmenu --removemake aritim-dark-kde

#yay -Sa --noconfirm --nodiffmenu --removemake plasma5-applets-virtual-desktop-bar-git
#yay -S --noconfirm --nodiffmenu --removemake plasma5-applets-latte-separator
#yay -S --noconfirm --nodiffmenu --removemake plasma5-applets-latte-sidebar-button
#yay -S --noconfirm --nodiffmenu --removemake plasma5-applets-window-title
yay -S --noconfirm --nodiffmenu --removemake plasma5-applets-window-buttons
#yay -S --noconfirm --nodiffmenu --removemake plasma5-applets-latte-spacer
