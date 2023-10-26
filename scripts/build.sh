#!/run/current-system/sw/bin/bash

cd "$(dirname "$0")" || exit 1

echo -n "Enter new hostname: "
read dir_name

validate_input() {
    while : ; do
        read -r input
        case $input in
            [Yy]) return 0 ;;
            [Nn]) return 1 ;;
            *) echo "Invalid input. Please enter Y or n:" ;;
        esac
    done
}

default_hardware_config_path="/etc/nixos/hardware-configuration.nix"
default_config_path="/etc/nixos/configuration.nix"

# Common path prefix
host_dir="hosts/$dir_name"

if test -s "$default_hardware_config_path"; then
    echo "/etc/nixos/hardware-configuration.nix exists and is not empty, would you like to import it? Y/n"
    if validate_input; then
        echo "Importing existing $default_hardware_config_path..."
        bool_import=true
    fi
else
    echo "File does not exist, would you like to generate both config files? Y/n"
    if validate_input; then
        echo "Generating $default_hardware_config_path..."
        bool_generate=true
    fi
fi

# Create directories and files
cd ..
mkdir -p "$host_dir" 
touch "$host_dir/default.nix" 

if bool_generate; then
    nixos-generate-config
    cp "$default_hardware_config_path" "$host_dir/" || { echo "Failed to copy $default_hardware_config_path"; exit 1; }
elif [ "$bool_import" = true ]; then
    cp "$default_hardware_config_path" "$host_dir/" || { echo "Failed to copy $default_hardware_config_path"; exit 1; }
fi
echo "Creating a basic default.nix file in $host_dir/default.nix..."
cat > "$host_dir/default.nix" << EOF
{
  imports = [
    ./hardware-configuration.nix
  ];
  #----Host specific config ----
}
EOF

