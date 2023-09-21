> :warning: **Disclaimer:** These are *machine specific flakes*. You *WILL* run into errors if you attempt to flake from this repo and you are not using my machines.

## Eriim's Nixflakes

This repo contains pure nix modules that can be imported to other Nix systems using a similar configuration. 

Modules are grouped by *functionality* and as such you will often find both the system configuration and the home-manager configuration in the same place. Not all Nix users will use this paradigm.

Some modules will require you to flake your configuration to fully use them, they have non-flaked counterparts. This includes:

Requires Flake:
- hyprland-nvidia.nix

Non Flake alternative:
- hyprland.nix

### To be done 
- Remove hardcoded values and pass via flake ie: username, hostname, etc

## Screenshots 
![Hyprland](screen-hyprland.png)

### My Nixdots contain configurations for:

- Desktop (erix-gnome)
    - DE: Customized Gnome w PopShell for a WM experience
    - Editor: Neovim
    - IDE: VSCode
    - Terminal: Foot
    - Browser(s): Firefox, Chromium, Nyxt
    - 1Password for SSH Authentication
    - Yubico Key 2FA

- Desktop (erix-hyprland)
    - WM: hyprland
    - Editor: Neovim
    - IDE: VSCode
    - Terminal: Foot
    - Browser(s): Firefox, Chromium, Nyxt
    - 1Password for SSH Authentication
    - Yubico Key 2FA

- Laptop (eriix-hyprland) [ Slightly stripped down version of my desktop ]
    - WM: hyprland
    - Editor: Neovim
    - IDE: VSCode
    - Terminal: Foot
    - Browser(s): Firefox, Chromium, Nyxt
    - 1Password for SSH Authentication

## Gnome

I use a highly customized Gnome desktop environment with Popshell for window management. This involves modifying a number of default mutter settings and it managed on a per user basis. This means we have to involve home-manager to accomplish this.

#### Gnome Screenshot

To see my nixdots without requiring flakes you can check out my configuration here for my gnome desktop:

[Enable Gnome](https://github.com/erictossell/nixdots/blob/main/desktop/modules/gnome.nix)

[Customize Gnome with Home-Manager](https://github.com/erictossell/nixdots/blob/main/desktop/modules/gnome-home.nix)

###### Disabling Hyprland
Enabling Gnome does require disabling Hyprland due to conflicts with differing XDG portals. Hopefully this will be fixed in the near future.

Thanks to the nature of NixOS this is trivial and the two modes can be interchanged reliably. 

Doing this often will have an impact on your SSD lifetime.


