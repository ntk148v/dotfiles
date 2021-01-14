chosen=$(echo -e "Cancel\nLogout\nShutdown\nReboot\nSuspend\nHibernate" | rofi -dmenu -i -l 6 -fullscreen 1)

if [[ $chosen = "Logout" ]]; then
	i3-msg exit
elif [[ $chosen = "Shutdown" ]]; then
	systemctl poweroff
elif [[ $chosen = "Reboot" ]]; then
	systemctl reboot
elif [[ $chosen = "Suspend" ]]; then
	systemctl suspend
elif [[ $chosen = "Hibernate" ]]; then
	systemctl hibernate
fi
