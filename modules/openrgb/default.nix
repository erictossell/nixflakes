{
   inputs,
   pkgs, 
   ...
}: 
{
	system.hardware.openrgb.enable = true;

	environments.systemPackages = with pkgs; [
		openrgb-with-all-plugins
	];
}

	
