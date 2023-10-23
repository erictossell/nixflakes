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


modify_hardware_config() {
    local file_path=$1
    sed -i \
        -e '1,10s/{ config, lib, pkgs, modulesPath, ... }:/ { config, lib, nixpkgs, ... }:/' \
        -e '1,10s/\[ (modulesPath + "\/installer\/scan\/not-detected.nix") \]/\[ "${nixpkgs}\/nixos\/modules\/installer\/scan\/not-detected.nix" \]/' \
        -e 's/\(modulesPath + "\/profiles\/qemu-guest.nix"\)/.\/qemu-guest.nix/' \
        "$file_path"
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
mkdir -p "$host_dir" "$host_dir/hardware" "$host_dir/home"
touch "$host_dir/default.nix" "$host_dir/hardware/default.nix" "$host_dir/home/default.nix"

if bool_generate; then
    nixos-generate-config
    cp "$default_hardware_config_path" "$host_dir/hardware/" || { echo "Failed to copy $default_hardware_config_path"; exit 1; }
    modify_hardware_config "$host_dir/hardware/hardware-configuration.nix"
elif [ "$bool_import" = true ]; then
    cp "$default_hardware_config_path" "$host_dir/hardware/" || { echo "Failed to copy $default_hardware_config_path"; exit 1; }
    modify_hardware_config "$host_dir/hardware/hardware-configuration.nix"
fi
# Prepare for copying a home/default.nix profile
echo "Select a profile to copy, or choose to create a basic default file:"
select profile in retis sisyphus aeneas "Create basic default file"; do
    case $profile in
      retis|sisyphus|aeneas)
            echo "Copying profile from hosts/$profile/home/default.nix to $host_dir/home/default.nix..."
            cp "hosts/$profile/home/default.nix" "$host_dir/home/default.nix" || { echo "Failed to copy profile"; exit 1; }
            cp "hosts/$profile/hardware/default.nix" "$host_dir/hardware/default.nix" || { echo "Failed to copy profile"; exit 1; }
            break
            ;;
        "Create basic default file")
            echo "Creating a basic default.nix file in $host_dir/home/default.nix..."
            cat > "$host_dir/home/default.nix" << EOF
{ pkgs, home-manager, username, hostname, ... }:
{
  imports = [
    home-manager.nixosmodules.default
  ];

  home-manager.users.${username} = { pkgs, ... }: {
    /* the home.stateversion option does not have a default and must be set */
    home.stateversion = "23.05";
    nixpkgs.config.allowunfree = true;
  };

  # ---- system configurations ---   
  # enable networking - available with nmcli and nmtui
  networking = {
    hostname = "${hostname}";
  }; 
}
EOF
            cat > "$host_dir/hardware/default.nix" << EOF
{ config, lib, pkgs, ... }:
{
	imports = [
		./hardware-configuration.nix
		../../../modules/hardware
	];
}
EOF

            break
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done

# Write to hosts/$dir_name/default.nix
cat > "$host_dir/default.nix" << EOF
{ config, lib, pkgs, ... }:
{
 imports = [
   ./home
   ./hardware
 ];
}
EOF

