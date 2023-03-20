#!/bin/bash

#cd ~
#git clone https://aur.archlinux.org/yay.git
#cd ~/yay
#makepkg -si
#cd ~
#rm -rf ~/yay
sudo dhcpcd
sleep 15
yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save
#安装AMD开源显卡驱动
yay -S --noconfirm xf86-video-amdgpu mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon
#安装AMD闭源官方驱动
#yay -S --noconfirm amdgpu-pro-libgl vulkan-amdgpu-pro
#安装视频硬解驱动
yay -S --noconfirm libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau
#安装字体
yay -S --noconfirm noto-fonts noto-fonts-cjk ttf-liberation nerd-fonts-hack nerd-fonts-jetbrains-mono nerd-fonts-droid-sans-mono
#安装KDE桌面
yay -S --noconfirm xray v2raya
yay -S --noconfirm fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-zhwiki fcitx5-material-color
sudo sh -c 'echo "GTK_IM_MODULE=fcitx" >> /etc/environment'
sudo sh -c 'echo "QT_IM_MODULE=fcitx" >> /etc/environment'
sudo sh -c 'echo "XMODIFIERS=@im=fcitx" >> /etc/environment'
yay -S --noconfirm oh-my-zsh-git
#sudo git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git /usr/share/oh-my-zsh/custom/themes/powerlevel10k
cp /usr/share/oh-my-zsh/zshrc ~/.zshrc
#sed -i "1,12s/=\"robbyrussell\"/=\"powerlevel10k\/powerlevel10k\"/g" ~/.zshrc
sed -i "1,12s/=\"robbyrussell\"/=\"ys\"/g" ~/.zshrc
sed -i "70,80s/(git)/(git sudo zsh-autosuggestions zsh-syntax-highlighting z)/g" ~/.zshrc
echo "bindkey ',' autosuggest-accept" >> ~/.zshrc
echo "export EDITOR='nvim'" >> ~/.zshrc
chsh -s /bin/zsh
yay -S --noconfirm xdg-user-dirs
xdg-user-dirs-update
yay -S --noconfirm firefox
yay -S --noconfirm xorg-server
yay -S --noconfirm feh picom bspwm polybar alacritty rofi ranger network-manager-applet sxhkd dunst bc pacman-contrib numlockx zenity freerdp
yay -S --noconfirm arc-gtk-theme lxappearance thunar thunar-archive-plugin xarchiver unrar p7zip tumbler papirus-icon-theme vimix-cursors
yay -S --noconfirm lightdm lightdm-webkit2-greeter light-locker
yay -S --noconfirm alsa-utils pulseaudio pulseaudio-alsa pavucontrol
sudo bash -c "sed -i '100,110s/#greeter-session=example-gtk-gnome/greeter-session=lightdm-webkit2-greeter/g' /etc/lightdm/lightdm.conf"
cp -r /home/data/dotfiles/bspwm/* ~/.config/
sudo systemctl enable lightdm NetworkManager v2raya
sudo localectl set-locale LANG=zh_CN.UTF-8
echo "export LANGUAGE='en'" >> ~/.zshrc
echo "alias en='LANGUAGE=en zsh'" >> ~/.zshrc
echo "alias cn='LANGUAGE=zh_CN zsh'" >> ~/.zshrc
#sudo bash -c "sed -i '/^webkit_theme/cwebkit_theme        = material2' /etc/lightdm/lightdm-webkit2-greeter.conf"
