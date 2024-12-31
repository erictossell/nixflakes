{
  hyprland,
  hyprpicker,
  pkgs,
  username,
  system,
  ...
}:
{
  imports = [
    hyprland.nixosModules.default
    ./config
    ./hypridle
    #./hyprlock
    ./mako
    ./swaylock
    ./redshift
    ./waybar
    ./wofi
  ];

  home-manager.users.${username} = _: {
    gtk = {
      enable = true;
      cursorTheme.name = "Adwaita";
      cursorTheme.package = pkgs.adwaita-icon-theme;
    };
  };

  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    systemPackages = with pkgs; [
      gammastep
      grim
      swww
      hyprpicker.packages.${system}.default
      lxqt.lxqt-policykit
      slurp
      wl-clipboard
      # Required if applications are having trouble opening links
      xdg-utils

      xfce.thunar
      xfce.tumbler
      xfce.thunar-volman
    ];
  };

  programs.hyprland.enable = true;
  programs.dconf.enable = true;

  services.gnome = {
    gnome-keyring.enable = true;
  };

  security.pam.services.login.enableGnomeKeyring = true;

  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = [
          "xdph"
          "gtk"
        ];
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
        "org.freedesktop.portal.FileChooser" = [ "xdg-desktop-portal-gtk" ];
      };
    };
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };
}
