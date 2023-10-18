{ pkgs, user, ... }:
let
  hyprPackages = import ../pkgs { inherit pkgs; };
in 
{
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = hyprPackages;
  
  # ---- System Configuration ---- 
  programs.dconf.enable = true;
  programs = { 
      hyprland = {
	   enable = true;
	   xwayland = {
	      enable = true;
	  };
          # enableNvidiaPatches = true;
        };
  };
 
  services.getty.autologinUser = user; 
  services.gnome = {
    gnome-keyring.enable = true;
  };
  # Unlock with Swaylock
  security = {
    #Application prompts
    polkit.enable = true;

    pam = {
      services = {
        swaylock = {
          fprintAuth = false;
          text = ''
            auth include login
          '';
        };
      };
    };
  };
  
}
