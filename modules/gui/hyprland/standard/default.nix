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
  environment.systemPackages = with pkgs; [ lxqt.lxqt-policykit ] ++ hyprPackages;
  
  # ---- System Configuration ---- 
  programs.dconf.enable = true;
  programs = { 
      hyprland = {
	   enable = true;
	  # xwayland.enable = true;
          # enableNvidiaPatches = true;
        };
  };
 
  services.getty.autologinUser = username; 

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
