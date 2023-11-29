#!/run/current-system/sw/bin/bash
source ~/.bashrc

if pgrep waybar > /dev/null; then
    pkill waybar
else
    waybar & disown
fi

