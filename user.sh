#!/bin/bash

#cd ~
#git clone https://aur.archlinux.org/yay.git
#cd ~/yay
#makepkg -si
#cd ~
#rm -rf ~/yay
#sudo dhcpcd
#sleep 15
#yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save
#安装AMD开源显卡驱动
yay -S --noconfirm xf86-video-intel mesa lib32-mesa
#安装AMD闭源官方驱动
#yay -S --noconfirm amdgpu-pro-libgl vulkan-amdgpu-pro
#安装视频硬解驱动
yay -S --noconfirm intel-media-driver
#安装X11
#yay -S --noconfirm xorg
#安装字体
yay -S --noconfirm noto-fonts noto-fonts-cjk ttf-liberation
#安装KDE桌面
yay -S --noconfirm plasma-meta sddm
#安装wayland启动项
yay -S --noconfirm plasma-wayland-session plasma-wayland-protocols qt5-wayland qt6-wayland xorg-xwayland
yay -S --noconfirm dolphin dolphin-plugins
#yay -S --noconfirm lightdm lightdm-webkit2-greeter
sudo systemctl enable NetworkManager sddm
#sudo bash -c "sed -i '100,110s/#greeter-session=example-gtk-gnome/greeter-session=lightdm-webkit2-greeter/g' /etc/lightdm/lightdm.conf"
yay -S --noconfirm zsh kvantum-qt5
#安装翻墙软件
#yay -S --noconfirm qv2ray qv2ray-plugin-trojan v2ray
#yay -S --noconfirm xray v2raya
#安装中文输入法
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
#yay -S --noconfirm xdg-user-dirs
#xdg-user-dirs-update
yay -S --noconfirm firefox
yay -S --noconfirm tela-icon-theme-git papirus-icon-theme
#mkdir -p ~/Themes/Qogir-kde
#git clone https://github.com/vinceliuice/Qogir-kde.git ~/Themes/Qogir-kde
#bash ~/Themes/Qogir-kde/install.sh
yay -S --noconfirm latte-dock-git yakuake gwenview plasma5-applets-eventcalendar kate cronie kcron
#yay -S --noconfirm spectacle flameshot

