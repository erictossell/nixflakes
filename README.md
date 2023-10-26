# Eriim's Nixflakes

[How to use this repo](docs/usage.md)

[Getting Started with NixOS Minimal](docs/minimal-install.md)

### Flake Structure
Modules are grouped to be almost purely *functional* and as a result you will often find both the system configuration and the home-manager configuration in the same place. Not all Nix users will this paradigm.             

This repo has become more opinionated over time and now requires passing down variables from the `flake.nix` in order to grab appropriate modules and packages. This area is heavily WIP.

![Flake Structure](docs/screens/FlakeStructure4.png)

![Flake Profiles](docs/screens/FlakeProfiles3.png)

## Screenshots

![Hyprland](docs/screens/hyprland1.png)

![Hyprland1](docs/screens/hyprland2.png)

![Hyprland3](docs/screens/hyprland3.png)

### My Nixdots Contain Configurations for

#### Core Modules
  - Browsers (Firefox, Chrome, Nyxt)
  - Nvidia
  - [OBS Studio](https://obsproject.com/) (for screen recording and streaming/sharing screen)
  - Security Config ([1Password](https://1password.com/), [Yubico](https://www.yubico.com/) Authentication)

#### Extra Toys
- Vidya (Steam, Wine)
- Virt (Docker, kvm/qemu)

#### Terminal Module
  - Editor: [`nvim`](https://neovim.io/), `vim`
  - Terminals: [`foot`](https://codeberg.org/dnkl/foot), [`alacritty`](https://github.com/alacritty/alacritty), [`wezterm`](https://wezfurlong.org/wezterm/index.html)
  - Shell: `bash`
  - [`btop` (Resource Monitoring)](https://github.com/aristocratos/btop)
  - [`cava` (Music Visualizer)](https://github.com/karlstav/cava)
  - [`nitch` (sysfetch)](https://github.com/ssleert/nitch)

#### Profiles
1. Desktop (retis) - 3 monitors

   - WM: [hyprland](https://hyprland.org/)
   - All core modules + nvidia

2. Laptop (sisyphus) - 1 monitor

   - WM: [hyprland](https://hyprland.org/)
   - Most core modules (no extra toys)

3. Laptop (icarus) - 1 monitor

   - WM: [hyprland](https://hyprland.org/)
   - Most core modules (no extra toys)

4. Specializations:

   i) gnome `sudo nixos-rebuild switch --flake '.#hostname' --specialization 'gnome'`

   - DE: Customised [Gnome](https://www.gnome.org/) w [PopShell](https://github.com/pop-os/shell) for a WM experience

   ii) plasma `sudo nixos-rebuild switch --flake '.#hostname' --specialization 'plasma'`

   - DE: [KDE Plasma](https://kde.org/plasma-desktop/)

### To Be Done

- SOPS for nixsecrets
- NVIDIA Imports by Driver (Currently only newer cards are supported)

[How to use this repo](docs/usage.md)

[Getting Started with NixOS Minimal](docs/minimal-install.md)
