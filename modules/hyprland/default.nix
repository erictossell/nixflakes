{ pkgs, nvidia_bool, username, ... }:
let
  hyprNvidia = {
    "enabled" = [ (import ./nvidia.nix {inherit hyprland pkgs;}) ];
    "disabled" = [ ];
    };
in
{
  imports = [
    ./config
    ./mako
    ./pkgs
    ./swaylock
    ./waybar
    ./wofi
  ]++ (hyprNvidia.${nvidia_bool} or [ ]);
  
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

  programs.dconf.enable = true;

  services.greetd = {
    enable = true;
    restart = false;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = username;
      };
      initial_session = {
        command = "${pkgs.hyprland}/bin/Hyprland";
        user = username;
      };
    };
  };

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
