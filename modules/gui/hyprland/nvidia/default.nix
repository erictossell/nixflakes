{ pkgs, displayConfig, home-manager, hyprland, username, ... }:
{

  imports = [
    ../pkgs
  ];

  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [ lxqt.lxqt-policykit  ];

  programs.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    package = hyprland.packages.${pkgs.system}.hyprland;
  };

  programs.dconf.enable = true;
  
  services.greetd = {
  enable = true;
  settings = {
    default_session = {
        command = "Hyprland";
        user = username;
      };
    };
  };
  services.gnome = {
    gnome-keyring.enable = true;
  };
  # Unlock with Swaylock
  security = {
    pam = {
      services = {
        login.enableGnomeKeyring = true;
      };
    };
  };
}
