# Hosts

In the [hosts directory](../hosts/), there are a collection of configurations for different host machines and formats.

## Overview

Here is a list of the current hosts available and a short description of each

- live-image
   - [default](../hosts/live-image/default.nix) - Create generic live images for deployment
   - [virtualbox](../hosts/live-image/virtualbox.nix) - Create live images for virtualbox deployment

- [vm](../hosts/vm/default.nix) - Full virtualization of NixOS, including the hardware configuration, using qemu
- [vm-temo](../hosts/vm-temp/default.nix) - Temporary virualization environment of NixOS using qemu
- [topher-laptop](../hosts/topher-laptop/default.nix) - Configuration for laptop (Razor Blade 15 2018)