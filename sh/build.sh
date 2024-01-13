#!/run/current-system/sw/bin/bash

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

cd "$(dirname "$0")" || exit 1

echo -n "Enter new hostname: "
read hostname

echo -n "Enter a new username: "
read username

echo -n "Do you use Nvidia? Y/n: "
if validate_input; then
    nvidia=true
else
    nvidia=false
fi

default_hardware_config_path="/etc/nixos/hardware-configuration.nix"
default_config_path="/etc/nixos/configuration.nix"

# Common path prefix
host_dir="hosts/$hostname"
user_dir="users/$username"

if test -s "$default_hardware_config_path"; then
    echo "/etc/nixos/hardware-configuration.nix exists and is not empty, would you like to import it? Y/n: "
    if validate_input; then
        echo "Importing existing $default_hardware_config_path..."
        bool_import=true
    fi
else
    echo "File does not exist, would you like to generate both config files? Y/n: "
    if validate_input; then
        echo "Generating $default_hardware_config_path..."
        bool_generate=true
    fi
fi

# Create directories and files
cd ..
mkdir -p "$host_dir" "$user_dir"
touch "$host_dir/default.nix"

if [ "$bool_generate" = true ]; then
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

echo "Creating a basic $username file in $user_dir/default.nix..."
cat > "$user_dir/default.nix" << EOF
{ pkgs, username, ... }:
{
# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    shell = pkgs.bash;
    isNormalUser = true;
    initialPassword = "temp123";
    extraGroups = [ "wheel" "input" ];
  };
}
EOF

echo "Creating a basic system configuration in flake.nix..."

if [ "$nvidia" = true ]; then
	read -r -d '' NEW_CONFIG << EOM
	
	# Appended new system
	$hostname =
       	let system = "x86_64-linux";
	in nixpkgs.lib.nixosSystem {
          specialArgs = {
            username = "$username";
            hostname = "$hostname";
            hyprlandConfig = "laptop";
	    inherit system;
          } // attrs;        
          modules = [
            ./.
	    ./modules/hardware/nvidia
          ];
        };#$hostname
EOM
else
	read -r -d '' NEW_CONFIG << EOM
	
	# Appended new system
	$hostname =
       	let system = "x86_64-linux";
	in nixpkgs.lib.nixosSystem {
          specialArgs = {
            username = "$username";
            hostname = "$hostname";
            hyprlandConfig = "laptop";
	    inherit system;
          } // attrs;        
          modules = [
            ./.
          ];
        };#$hostname
EOM
fi
awk -v n="$NEW_CONFIG" '
    /}; #configurations/ { print n; print; next }
    { print }
' flake.nix > temp && mv temp flake.nix

echo "Validate that this import when okay by running 'nix flake check'."
