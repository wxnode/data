#!/bin/bash

#安装Intel显卡驱动
yay -S --noconfirm yay -S --noconfirm mesa
#安装视频硬解驱动
yay -S --noconfirm intel-media-driver
#安装字体
yay -S --noconfirm noto-fonts noto-fonts-cjk ttf-liberation nerd-fonts-hack nerd-fonts-jetbrains-mono nerd-fonts-droid-sans-mono
#安装Fcitx5输入法
yay -S --noconfirm fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-zhwiki fcitx5-material-color
sudo sh -c 'echo "GTK_IM_MODULE=fcitx" >> /etc/environment'
sudo sh -c 'echo "QT_IM_MODULE=fcitx" >> /etc/environment'
sudo sh -c 'echo "XMODIFIERS=@im=fcitx" >> /etc/environment'
#安装oh-my-zsh并设置
yay -S --noconfirm oh-my-zsh-git
#sudo git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git /usr/share/oh-my-zsh/custom/themes/powerlevel10k
cp /usr/share/oh-my-zsh/zshrc ~/.zshrc
#sed -i "1,12s/=\"robbyrussell\"/=\"powerlevel10k\/powerlevel10k\"/g" ~/.zshrc
sed -i "1,12s/=\"robbyrussell\"/=\"ys\"/g" ~/.zshrc
sed -i "70,80s/(git)/(git sudo zsh-autosuggestions zsh-syntax-highlighting z)/g" ~/.zshrc
echo "bindkey ',' autosuggest-accept" >> ~/.zshrc
echo "export EDITOR='nvim'" >> ~/.zshrc
chsh -s /bin/zsh
#安装浏览器
yay -S --noconfirm firefox
#安装xorg
yay -S --noconfirm xorg-server
yay -S --noconfirm feh picom bspwm polybar alacritty rofi ranger network-manager-applet sxhkd dunst bc pacman-contrib numlockx zenity freerdp
yay -S --noconfirm arc-gtk-theme lxappearance thunar thunar-archive-plugin xarchiver unrar p7zip tumbler papirus-icon-theme vimix-cursors
#安装SDDM
yay -S --noconfirm sddm
yay -S --noconfirm alsa-utils pulseaudio pulseaudio-alsa pavucontrol
sudo systemctl enable sddm NetworkManager
