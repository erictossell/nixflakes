#!/run/current-system/sw/bin/bash

volume_up() {
	pactl set-sink-volume "$1" +2%
}
volume_down() {
	pactl set-sink-volume "$1" -2%
}
volume_mute() {
	pactl set-sink-mute "$1" toggle
}

# Get the currently active sink
CURRENT_SINK=$(pactl list short sinks | grep RUNNING | awk '{print $1}')

if [ -z "$CURRENT_SINK" ]; then
	echo "No active sink found."
	exit 1
fi

case "$1" in 
	--up)
		volume_up "$CURRENT_SINK"
		;;
	--down)
		volume_down "$CURRENT_SINK"
		;;
	--mute)
		volume_mute "$CURRENT_SINK"
		;;
	*)
		echo "Usage: $0 --up | --down | --mute"
		exit 1
		;;
esac
