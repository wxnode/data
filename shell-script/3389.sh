#! /bin/bash

OUTPUT=`zenity --forms --separator="," --add-entry="ip" --add-entry="user" --add-password="password" --width=10 --height=30`

if [ ! -n "$OUTPUT" ]; then
	echo "is null"
	else	
	ip=$(awk -F, '{print $1}' <<<$OUTPUT)
	user=$(awk -F, '{print $2}' <<<$OUTPUT)
	password=$(awk -F, '{print $3}' <<<$OUTPUT)
	xfreerdp /cert-tofu /u:$user /p:$password /v:$ip
	#xfreerdp /cert-tofu /u:zeng /p:zeng123456 /v:192.168.1.2
	#rdesktop $remoteip
fi
exit 0
