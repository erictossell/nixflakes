# Creating Installation Media From NixOS Configurations

NixOS makes it trivial to create your own bootable USB or installation media. The `live-image` host in this repository is used as a base layer to apply customization ontop of the minimal nixos-installer.

## Usage

This flake supports building images based off the live-image host with the following command:

`nix build .#nixosConfigurations.live-image.config.system.build.isoImage`

The resulting `.iso` file will be deposited in `/result/iso/*.iso`.


