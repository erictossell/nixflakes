declare -A commands
commands=( ["1"]="sudo nixos-rebuild switch --flake '.#eriix-hyprland' -p \"hyprland\""  )

while true; do 
	echo "Select a build option:"
	echo "1) eriix-hyprland (Command:${commands[1]})"
	echo "4) Exit"
	read -p "Enter choice [ 1 ] " choice

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
  
  # Pause before clearing the screen and showing the menu again.
  read -n 1 -s -r -p "Press any key to continue"
  clear
done

