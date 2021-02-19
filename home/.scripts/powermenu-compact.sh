
#!/bin/sh

# options to be displayed
option0="⏻   Shutdown"
option1="􀅈   Reboot"
option2="􀎠   Lock"
option3="⎋   Logout"
option4="􀟙   Suspend"

uptime=$(uptime -p | sed -e 's/up //g')

# options passed into variable
options="$option0\n$option1\n$option2\n$option3\n$option4"

chosen="$(echo -e "$options" | rofi -theme ~/.config/rofi/powermenu.rasi -lines 5 -dmenu -p "$uptime")"

case $chosen in
    $option0)
        loginctl poweroff
        ;;
    $option1)
        loginctl reboot
        ;;
    $option2)
        betterlockscreen --lock blur
        ;;
	$option3)
        killall -u $USER
        ;;
    $option4)
        loginctl suspend
        ;;
esac
