#! /bin/bash

ask=`zenity --list --text="靓仔你想干啥?" --hide-header --column="0" "关机好睡觉" "重启治百病" "锁定护隐私" --ok-label="确定" --cancel-label="取消"`

if [ "$ask" == "关机好睡觉" ]; then
    systemctl poweroff
fi

if [ "$ask" == "重启治百病" ]; then
    systemctl reboot
fi

if [ "$ask" == "锁定护隐私" ]; then
    light-locker-command -l
fi

exit 0
