#!/bin/bash
#sed -i '/\# Last Check/a\Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/\$arch' /etc/pacman.d/mirrorlist
sed -i '/\# Last Check/a\Server = https://mirrors.bfsu.edu.cn/archlinuxcn/\$arch' /etc/pacman.d/mirrorlist
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc
sed -i "24i zh_CN.UTF-8 UTF-8" /etc/locale.gen
sed -i "24i en_US.UTF-8 UTF-8" /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "dell-wyse" > /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.0.1 dell-wyse.localdomain dell-wyse" >> /etc/hosts
pacman -S --noconfirm neovim grub efibootmgr
efibootmgr -b 0000 -B
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ArchGrub
#sed -i 's/TIMEOUT=5/TIMEOUT=0/g' /etc/default/grub
#echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
echo "Please enter root's new password"
passwd root
