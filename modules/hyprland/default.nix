{ hyprland, pkgs, nvidia_bool, username, ... }:
let
  hyprNvidia = {
    "enabled" = [ (import ./nvidia.nix) ];
    "disabled" = [ ];
    };
in
{
  imports = [
    hyprland.nixosModules.default
    ./config
    ./greetd
    ./mako
    ./swaylock
    ./waybar
    ./wofi
  ] ++ (hyprNvidia.${nvidia_bool} or [ ]);
  
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  
  environment.systemPackages = with pkgs; [ 
    eww-wayland
    grim
    hyprpaper
    hyprpicker
    lxqt.lxqt-policykit
    slurp
    wl-clipboard
    # Required if applications are having trouble opening links
    xdg-utils
  ];
  
  programs.hyprland.enable = true;

  programs.dconf.enable = true;
  
  services.gnome = {
    gnome-keyring.enable = true;
  };

  security = {
    pam = {
      services = {
        login.enableGnomeKeyring = true;
      };
    };
  };
}

