{ config, lib, pkgs, ... }:
{
	imports = [
		./hardware-configuration.nix
		./qemu-guest.nix
	];
}

