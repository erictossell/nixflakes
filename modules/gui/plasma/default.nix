{ config, pkgs, ... }:
{
	programs.dconf.enable=true;
	services.xserver = {
		enable = true;
		displayManager.sddm.enable = true;
		displayManager.defaultSession = "plasmawayland";
		desktopManager.plasma5.enable = true;		
	};
	environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
