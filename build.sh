#!/run/current-system/sw/bin/bash
#!/bin/bash

declare -A hosts
hosts=( ["1"]="desktop" ["2"]="laptop" ) 

declare -A desktop_commands
desktop_commands=( ["1"]="sudo nixos-rebuild switch --flake '.#desktop-hyprland' -p \"Hyprland\"" ["2"]="sudo nixos-rebuild switch --flake '.#desktop-gnome' -p \"Gnome\" " ["3"]="sudo nixos-rebuild switch --flake '.#desktop-plasma' -p \"KDE-Plasma\" ")

declare -A laptop_commands
laptop_commands=( ["1"]="sudo nixos-rebuild switch --flake '.#laptop-hyprland' -p \"Hyprland\" ")

echo "Select a host:"
for i in "${!hosts[@]}"; do
  echo "$i) ${hosts[$i]}"
done
read -p "Enter choice: " host_choice

current_host=$(hostname)
selected_host=${hosts[$host_choice]}

if [ "$selected_host" != "$current_host" ]; then
  echo "Warning: The selected host ($selected_host) does not match the hostname of this device ($current_host)."
  read -p "Do you want to continue? (y/n) " continue_choice
  if [ "$continue_choice" != "y" ] && [ "$continue_choice" != "Y" ]; then
    echo "Exiting."
    exit 1
  fi
fi

declare -A commands
if [ "$selected_host" == "desktop" ]; then
  for key in "${!desktop_commands[@]}"; do commands["$key"]="${desktop_commands[$key]}"; done
elif [ "$selected_host" == "laptop" ]; then
  for key in "${!laptop_commands[@]}"; do commands["$key"]="${laptop_commands[$key]}"; done
fi

while true; do 
  echo "Select a build option:"
  for i in "${!commands[@]}"; do
    echo "$i) $selected_host (Command: ${commands[$i]})"
  done
  echo "4) Exit"

  read -p "Enter choice [ 1 -3 ] " choice

  case $choice in
    1|2|3)
      echo "You selected option $choice (Command: ${commands[$choice]})"
      read -p "Are you sure you want to proceed? (y/n) " confirm
      if [ "$confirm" == "y" ] || [ "$confirm" == "Y" ]; then
        echo "Running: ${commands[$choice]}"
        eval "${commands[$choice]}"
      else
        echo "Cancelled."
      fi
      ;;
    4)
      echo "Exiting."
      exit 0
      ;;
    *)
      echo "Invalid choice, please choose between 1-4."
  esac
  clear
done

