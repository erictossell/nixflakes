#!/run/current-system/sw/bin/bash

declare -A hosts
hosts=( ["1"]="erix" ["2"]="eriix" ) 

declare -A erix_commands
erix_commands=( ["1"]="sudo nixos-rebuild switch --flake '.#erix-hyprland' -p \"hyprland\"" ["2"]="sudo nixos-rebuild switch --flake '.#erix-gnome' -p \"gnome\" ")

declare -A eriix_commands
eriix_commands=( ["1"]="sudo nixos-rebuild switch --flake '.#eriix-hyprland' -p \"hyprland\" ")

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
if [ "$selected_host" == "erix" ]; then
  commands=("${erix_commands[@]}")
elif [ "$selected_host" == "eriix" ]; then
  commands=("${eriix_commands[@]}")
fi

while true; do 
  echo "Select a build option:"
  for i in "${!commands[@]}"; do
    echo "$i) $selected_host-$(echo $i | awk -F'-' '{print $2}') (Command: ${commands[$i]})"
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
  
  read -n 1 -s -r -p "Press any key to continue"
  clear
done
