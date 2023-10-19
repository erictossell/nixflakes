#!/run/current-system/sw/bin/bash

PS3='Enter a choice: '

options=("Hyprland" "System" "Desktop" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Hyprland")
            echo "You chose Hyprland"
            sudo nixos-rebuild switch --flake '.' -p "Hyprland"
            ;;
        "System")
            echo "You chose System"
            # Your command here e.g., pwd
            sudo nixos-rebuild switch --flake '.'
            ;;
        "Desktop")
            echo "You chose Desktop <deprecated>"
            # Your command here e.g., whoami
            ;;
        "Quit")
            break
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done

