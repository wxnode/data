 #!/bin/bash
timedatectl set-ntp true
mkfs.fat -F32 /dev/mmcblk0p1
mkfs.ext4 -F /dev/mmcblk0p2
mount /dev/mmcblk0p2 /mnt
mkdir /mnt/boot
mount /dev/mmcblk0p1 /mnt/boot
#sed -i "6i Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch" /etc/pacman.d/mirrorlist
sed -i "6i Server = https://mirrors.bfsu.edu.cn/archlinux/\$repo/os/\$arch" /etc/pacman.d/mirrorlist
pacstrap /mnt base base-devel linux linux-firmware dhcpcd
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
