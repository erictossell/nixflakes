#!/run/current-system/sw/bin/bash

echo "Enter the device name (e.g., /dev/vda or /dev/sda): "
read -r DEVICE

BOOT_PARTITION="${DEVICE}1"
ROOT_PARTITION="${DEVICE}2"

printf "label: gpt\n,550M,U\n,,L\n" | sfdisk "$DEVICE"

mkfs.fat -F 32 "$BOOT_PARTITION"
mkfs.btrfs "$ROOT_PARTITION"

mkdir -p /mnt
mount "$ROOT_PARTITION" /mnt
btrfs subvolume create /mnt/root
btrfs subvolume create /mnt/home
btrfs subvolume create /mnt/nix
umount /mnt

mount -o compress=zstd,subvol=root "$ROOT_PARTITION" /mnt
mkdir /mnt/{home,nix}
mount -o compress=zstd,subvol=home "$ROOT_PARTITION" /mnt/home
mount -o compress=zstd,noatime,subvol=nix "$ROOT_PARTITION" /mnt/nix
mkdir /mnt/boot
mount "$BOOT_PARTITION" /mnt/boot

nixos-generate-config --root /mnt

nix-shell -p neovim
