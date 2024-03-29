#!/bin/bash
#dhcpcd
#sleep 15
#fallocate -l 4G /swapfile
#chmod 600 /swapfile
#mkswap /swapfile
#swapon /swapfile
#echo "# Swap" >> /etc/fstab
#echo "/swapfile none swap defaults 0 0" >> /etc/fstab
grub-mkconfig -o /boot/grub/grub.cfg
sed -i '$a[multilib]' /etc/pacman.conf
sed -i '$aInclude = /etc/pacman.d/mirrorlist' /etc/pacman.conf
sed -i '$a[archlinuxcn]' /etc/pacman.conf
#sed -i '$aServer = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/\$arch' /etc/pacman.conf
sed -i '$aServer = https://mirrors.bfsu.edu.cn/archlinuxcn/\$arch' /etc/pacman.conf
pacman -Syy
pacman -S --noconfirm archlinuxcn-keyring
pacman -S --noconfirm git yay
useradd -m jayden
bash -c 'echo "Defaults timestamp_timeout=-1" > /etc/sudoers.d/user'
bash -c 'echo "jayden ALL=(ALL:ALL) ALL" >> /etc/sudoers.d/user'
#echo 'Defaults env_keep += "*_proxy *_PROXY"' >> /etc/sudoers.d/05_proxy
echo "Please enter jayden's new password"
passwd jayden
