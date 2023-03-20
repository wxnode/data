#!/bin/bash
dhcpcd
sleep 15
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
sed -i '$aServer = https://mirrors.bfsu.edu.cn/archlinuxcn/\$arch' /etc/pacman.conf
pacman -Syy
pacman -S --noconfirm archlinuxcn-keyring
pacman -S --noconfirm git yay
useradd -m -g users -G wheel jayden
export EDITOR=nvim
visudo
#echo 'Defaults env_keep += "*_proxy *_PROXY"' >> /etc/sudoers.d/05_proxy
echo "Please enter jayden's new password"
passwd jayden
mkdir /mnt/data1
mkdir /mnt/data2
echo "#NTFS partiton" >> /etc/fstab
echo "/dev/sda1 /mnt/data1 ntfs-3g uid=jayden,gid=users 0 0" >> /etc/fstab
echo "/dev/sdb1 /mnt/data2 ntfs-3g uid=jayden,gid=users 0 0" >> /etc/fstab

#echo 'kernel.sysrq = 1' >> /etc/systl.d/99-sysrq-sysctl.conf

#预先写入rclone挂在启动服务
cat > /etc/systemd/system/rclone.service <<EOF
[Unit]
Description=rclone mount main onedrive
AssertPathIsDirectory=/home/data/onedrive
After=network-online.target

[Service]
Type=simple
ExecStart=rclone mount onedrive:/ /home/data/onedrive --no-gzip-encoding --allow-other --allow-non-empty --vfs-cache-mode full --vfs-cache-max-age 48h --vfs-cache-max-size 10G --vfs-read-chunk-size 128M --vfs-read-chunk-size-limit 1G --buffer-size 128M --config /home/jayden/.config/rclone/rclone.conf
ExecStop=fusermount -u /home/data/onedrive
Restart=on-abort
User=root

[Install]
WantedBy=default.target
EOF
