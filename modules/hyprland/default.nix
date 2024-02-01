{ hyprland, pkgs, username, ... }:
{
  imports = [
    hyprland.nixosModules.default
    ./config
    ./greetd
    ./mako
    ./swaylock
    ./waybar
    ./wofi
  ];

  environment = {
    sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
    sessionVariables.NIXOS_OZONE_WL = "1";
    systemPackages = with pkgs; [
      eww-wayland
      grim
      hyprpaper
      hyprpicker
      lxqt.lxqt-policykit
      slurp
      wl-clipboard
      # Required if applications are having trouble opening links
      xdg-utils

      gnome.adwaita-icon-theme
      glib
    ];
  };

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

  xdg.portal.config = {
    common = {
      default = [ "xdph" "gtk" ];
      "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
    };

  };
}

