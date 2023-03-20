#!/bin/bash
zenity --question --title="关机" --text="靓仔你确定要关机了吗？"
response=$?

if [ "$response" = "0" ]; then
    systemctl poweroff
fi
exit 0
