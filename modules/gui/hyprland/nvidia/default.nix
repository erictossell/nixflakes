{ pkgs, displayConfig, home-manager, hyprland, username, ... }:
let
  dotfiles = {
    "1monitor" = [ (import ../dotfiles/1monitor { inherit home-manager username; }) ];
    "3monitor" = [ (import ../dotfiles/3monitor { inherit home-manager username; }) ];
  };
  hyprPackages = import ../pkgs { inherit pkgs; };
in
{

  imports = [
    (import ../dotfiles/shared { inherit home-manager username; })
  ] ++ (dotfiles.${displayConfig} or [ ]); 

  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [ lxqt.lxqt-policykit  ] ++ hyprPackages;

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
