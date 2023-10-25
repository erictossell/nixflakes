{ pkgs, displayConfig, home-manager, hyprland, username, ... }:
{

  imports = [
    ../pkgs
  ];
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [ lxqt.lxqt-policykit ];
  
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
}
