{ config, lib, pkgs, ... }:
{
	imports = [
		./hardware-configuration.nix
		../../../modules/nvidia
		../../../modules/hardware
	];
}

