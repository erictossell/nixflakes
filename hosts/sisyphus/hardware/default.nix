{ config, lib, pkgs, ... }:
{
	imports = [
		./hardware-configuration.nix
		../../../modules/hardware
	];
}

