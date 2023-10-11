{ config, pkgs, user, ... }:
{
	programs.dconf.enable=true;
	services.xserver = {
		enable = true;
		displayManager.sddm.enable = true;
		desktopManager.plasma5.enable = true;
  };
}
