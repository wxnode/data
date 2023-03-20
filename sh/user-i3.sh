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
yay -S --noconfirm noto-fonts noto-fonts-cjk ttf-liberation nerd-fonts-source-code-pro
#安装KDE桌面
yay -S --noconfirm qv2ray qv2ray-plugin-trojan v2ray
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
chsh -s /bin/zsh
#yay -S --noconfirm xdg-user-dirs
#xdg-user-dirs-update
yay -S --noconfirm firefox
yay -S --noconfirm xorg-server feh compton i3-gaps polybar alacritty rofi ranger
#yay -S --noconfirm lightdm lightdm-webkit2-greeter
yay -S --noconfirm alsa-utils pulseaudio pulseaudio-alsa pavucontrol-qt-git
#sudo bash -c "sed -i '100,110s/#greeter-session=example-gtk-gnome/greeter-session=lightdm-webkit2-greeter/g' /etc/lightdm/lightdm.conf"
install -Dm644 /usr/share/doc/polybar/config $HOME/.config/polybar/config
install -Dm644 /etc/i3/config $HOME/.config/i3/config
sudo systemctl enable dhcpcd
#sudo cp /etc/X11/xinit/xinitrc ~/.xinitrc
#echo "#!/bin/bash" >> ~/.xinitrc
#echo "exec compton -b &" >> ~/.xinitrc
#echo "#exec fcitx5 &" >> ~/.xinitrc
#echo "exec i3 -V >> ~/.config/i3/log/i3log-\$(date +'%F-%k-%M-%S') 2>&1" >> ~/.xinitrc
cp ./.xinitrc ~/
