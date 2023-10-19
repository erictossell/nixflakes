{ config, lib, pkgs, ... }:

{
	
	boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
	boot.initrd.kernelModules = [ ];
	boot.kernelModules = [ "kvm-amd" ];
	boot.extraModulePackages = [ ];

	fileSystems."/" = {
		device = "/dev/disk/by-uuid/b43d016b-7707-4cb4-8f6c-8a7dcc264273";
		fsType = "ext4";
	};

	boot.initrd.luks.devices."luks-6b8fec0a-e846-4cda-ac66-eeddd2b1ce53".device = "/dev/disk/by-uuid/6b8fec0a-e846-4cda-ac66-eeddd2b1ce53";

	swapDevices = [ ];

	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	# Bootloader.
	boot.loader = {
		grub.enable = true;
		grub.device = "/dev/vda";
		grub.useOSProber = true;
	};
	boot.initrd.secrets = {
		"/crypto_keyfile.bin" = null;
	};

	boot.loader.grub.enableCryptodisk = true;
	boot.initrd.luks.devices."luks-6b8fec0a-e846-4cda-ac66-eeddd2b1ce53".keyFile = "/crypto_keyfile.bin";
 
}
