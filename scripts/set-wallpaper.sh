#!/run/current-system/sw/bin/bash

# Function to get the latest file from a directory
get_latest_file() {
    local dir=$1
    find "$dir" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) -printf "%T@ %p\n" | sort -n | tail -1 | cut -f2- -d" "
}

# Define the directory
directory="$HOME/Pictures"

# Get the latest file from the directory
latest_file=$(get_latest_file "$directory")

# Check if a file was found
if [[ -n $latest_file ]]; then
    # Run the command with the path to the latest file
    hyprctl hyprpaper preload $latest_file
    hyprctl hyprpaper wallpaper "DP-2, $latest_file"
else
    echo "No image files found in the specified directory."
fi
