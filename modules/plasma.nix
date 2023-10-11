{ config, pkgs, user, ... }:
{
	programs.dconf.enable=true;
	services.xserver = {
		enable = true;
		displayManager.sddm.enable = true;
		displayManager.defaultSession = "plasmawayland";
		desktopManager.plasma5.enable = true;
		
  };
}
