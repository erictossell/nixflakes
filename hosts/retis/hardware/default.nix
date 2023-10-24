{ config, lib, pkgs, ... }:
{
	imports = [
		./hardware-configuration.nix
		../../hardware
	];
}

