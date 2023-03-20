#! /bin/bash
wallpaperdir="/home/data/onedrive/Pictrues/Wallpapers/"
randomfile=`ls -1 "$wallpaperdir" | sort --random-sort | head -1`
file_name=$wallpaperdir$randomfile
script='var allDesktops = desktops();print (allDesktops);for (i=0;i<allDesktops.length;i++) {d = allDesktops[i];d.wallpaperPlugin = "org.kde.image";d.currentConfigGroup = Array("Wallpaper", "org.kde.image", "General");d.writeConfig("Image", "file://'$file_name'")}'

export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript "$script"
