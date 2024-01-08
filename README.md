> :warning: **I am not an authority on `Nix` or `NixOS`. I am merely an apprentice, an *Alice* navigating the *wonderland*. At least for now.**

So anyways. Here's my dots. I hope you like them.

# Eriim's Nixflakes

```
There are many paths to the top of the mountain, but the view is always the same.
```

[How to use this repo](docs/usage.md)

[Getting Started with NixOS Minimal](docs/minimal-install.md)

### Flake Structure
Modules are grouped to be ***almost*** purely *functional* and as a result you will often find both the system configuration and the home-manager configuration in the same place. Not all NixOS users use this paradigm.

This repo has become more opinionated over time and now requires passing down variables from the `flake.nix` in order to fetch appropriate `host` and `user` specific configurations for a given device.

My `nixvim` configuration is available as a standalone at [https://github.com/erictossell/eriixvim](https://github.com/erictossell/eriixvim).
Want to give it a temporary try? Without installing anything else?
Just run `nix run github:erictossell/eriixvim` 

[`nixvim`](https://github.com/nix-community/nixvim) allows for building fully reproducible neovim configurations. Build your neovim config once and run it anywhere, even on Windows (with `wsl`).

### Flake Github URLS

Transparency is cool.

[nixpkgs: nixos-unstable](https://github.com/NixOS/nixpkgs)

[home-manager: following nixpkgs](https://github.com/nix-community/home-manager/blob/master/flake.nix)

[agenix: following nixpkgs](https://github.com/ryantm/agenix/blob/main/flake.nix)

[hyprland](https://github.com/hyprwm/Hyprland/blob/main/flake.nix)

[eriixvim: my nixvim flake](https://github.com/erictossell/eriixvim/blob/main/flake.nix)

[ruSSH: a simple SSH multiplier](https://github.com/erictossell/russh/blob/main/flake.nix)

### Diagrams

![Flake Structure](docs/screens/FlakeStructure8.png)

![Flake Profiles](docs/screens/FlakeProfiles8.png)

## Screenshots

Current 
------
![Hyprland](docs/screens/hyprland4.png)
![Hyprland](docs/screens/hyprland5.png)

October 2023
------
![Hyprland](docs/screens/hyprland1.png)

![Hyprland1](docs/screens/hyprland2.png)

![Hyprland3](docs/screens/hyprland3.png)

#### Configurations
1. Desktop (principium) - 3 monitors

   - WM: [hyprland](https://hyprland.org/)
   - All core modules + nvidia

2. Laptop (sisyphus) - 1 monitor

   - WM: [hyprland](https://hyprland.org/)
   - Most core modules (no extra toys)

3. Live Boot Image (live-image)

   - A customized live-installation media example.

4. WSL Configuration (winix)

    - My fully reproducible `linux` terminal environment on `Windows`.

[How to use this repo](docs/usage.md)

[Getting Started with NixOS Minimal](docs/minimal-install.md)
