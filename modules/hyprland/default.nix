{ pkgs, nvidia_bool, username, ... }:
let
  hyprNvidia = {
    "enabled" = [ (import ./nvidia.nix {inherit pkgs username;}) ];
    "disabled" = [ (import ./standard.nix {inherit pkgs username;}) ];
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
  environment.systemPackages = with pkgs; [ hyprpaper hyprpicker lxqt.lxqt-policykit ];

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
