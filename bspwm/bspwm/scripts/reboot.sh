#!/bin/bash
zenity --question --title="重启" --text="靓仔你确定要重启了吗？"
response=$?

if [ "$response" = "0" ]; then
    systemctl reboot
fi
exit 0
