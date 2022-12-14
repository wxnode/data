 #!/bin/bash
timedatectl set-ntp true
mkfs.fat -F32 /dev/nvme1n1p1
mkfs.ext4 -F /dev/nvme1n1p2
mount /dev/nvme1n1p2 /mnt
mkdir /mnt/boot
mkdir /mnt/home
mount /dev/nvme1n1p1 /mnt/boot
mount /dev/nvme1n1p3 /mnt/home
sed -i "6i Server = https://mirrors.bfsu.edu.cn/archlinux/\$repo/os/\$arch" /etc/pacman.d/mirrorlist
#sed -i "6i Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch" /etc/pacman.d/mirrorlist
pacstrap /mnt base base-devel linux linux-firmware dhcpcd
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
