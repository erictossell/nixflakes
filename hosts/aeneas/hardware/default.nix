{ config, lib, pkgs, ... }:
{
	imports = [
		./hardware-configuration.nix
 	        ../../../profiles/qemu-guest.nix
	];
}

