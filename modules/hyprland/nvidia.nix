{ pkgs, username, ... }:
{
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [ lxqt.lxqt-policykit  ];

  programs.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
  };

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
  # Unlock with Swaylock
  security = {
    pam = {
      services = {
        login.enableGnomeKeyring = true;
      };
    };
  };
}