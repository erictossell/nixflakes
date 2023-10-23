{ pkgs, home-manager, hyprland, username, ... }:
let
  hyprPackages = import ../pkgs { inherit pkgs; };
in
{
  imports = [ hyprland.nixosModules.default ];
  
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [ lxqt.lxqt-policykit  ] ++ hyprPackages;

  programs.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
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
    polkit.enable = true;
    pam = {
      services = {
        swaylock = {
          fprintAuth = false;
          text = ''
            auth include login
          '';
        };
    
   
        login.enableGnomeKeyring = true;
      };
    };
  };
}
