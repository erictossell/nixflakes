# NixOS Minimal Install - From Live ISO

The official NixOS.org site has excellent documentation to get you started. This is a condensed version for myself.

https://nixos.org/manual/nixos/stable/#sec-booting-from-usb

You've loaded NixOS on a live USB to do a minimal install because the GUI is no fun, what now?

1. Flash the minimal image to a USB device from Linux
`sudo dd if=<nixos-minimal-image.iso> of=/path/to/usb bs=4M conf=fsync`
2. Boot from the USB on the target device

## Wireless Networking
1. Start wpa_supplicant
`sudo systemctl start wpa_supplicant`
2. Enable a wireless network
`wpa_cli`
```
add_network 0
set_network 0 ssid "SSID"
set_netwwork 0 psk "PSK"
set_network 0 key_mgmt WPA-PSK
enable_network 0
```
## Partition
3. `lsblk` - to identify connected drives
4. Format the disk
`sudo fdisk /dev/path-to-target`

a. Create a new GPT partition table
`g`
b. Create a new partition
`n`
c. Create the following structure at minimum
```
|-/dev/sda1 efi   > t > 1
|-/dev/sda2 linux-filesystem 
|-/dev/sda3 (optional)swap t > 19
```
d. Write changes to disk
`w`

## Format
1. For EFI > `sudo mkfs.fat -F 32 /dev/sda1`
2. For Primary > `sudo mkfs.ext4 /dev/sda2`
3. For swap > `sudo mkswap -L swap /dev/sda3` > `sudo swapon`

## Encrypted Primary
1. Format with LUKS > `cryptsetup luksFormat /dev/sda2`
2. Open with LUKS > `cryptsetup luksOpen /dev/sda2 cryptroot`
3. Format mapped cryptroot > `sudo mkfs.ext4 -L nixos /dev/mapper/cryptroot`
## Mounting
1. Mount the primary partition to `/mnt` > `sudo mount /dev/disk/by-label/nixos /mnt`
2. Make boot dir > `sudo mkdir -p /mnt/boot`
3. Mount boot > `sudo mount /dev/sda1 /mnt/boot`

## Generate configuration
1. Generate > `sudo nixos-generate-config --root /mnt`
2. Edit `configuration.nix` > `sudo nano /mnt/etc/nixos/configuration.nix`

## Minimal Configuration for wireless networking with wpa_supplicant
```
{ config, pkgs, ... }:
{
	imports = [ ./hardware-configuration.nix ]
	
	boot.loader.systemd-boot.enalbe = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.wireless.enable = true;
	networking.wireless.interface = [ "interface" ];
	networking.wireless.userControlled.enable = true;

	users.users.user = {
		isNormalUser = true;
		extraGroups = [ "wheel" ];
		initialPassword = "temp123";	
	};
	system.stateVersion = "23.05";
}
```

## Enable swap in hardware-configuration.nix
```
swapDevices = [ { device = "/dev/disk/by-label/swap"; } ];
```

## Install and reboot
1. Install > `sudo nixos-install`
2. You will be prompted for a root password afterwards.
3. Reboot > `sudo reboot`
