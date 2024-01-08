> :warning: **I am not an authority on `Nix` or `NixOS`. I am merely an apprentice, an *Alice* navigating the *wonderland*. At least for now.**

So anyways. Here's my dots. I hope you like them.

# Eriim's Nixflakes

```
There are many paths to the top of the mountain, but the view is always the same.
```

[How to use this repo](docs/usage.md)

[Getting Started with NixOS Minimal](docs/minimal-install.md)

## What is in this repo?

#### 1. A [modular](https://github.com/erictossell/nixflakes/blob/main/docs/screens/FlakeStructure8.png) (opinionated) Configuration Structure

#### 2. Flake templates - Quickly grab this configuration and make it your own with:

```nix
nix flake new -t github:erictossell/nixflakes ./<your-repo-name-here>
```

#### 3. An interactive build script for adding new [`hosts`](https://github.com/erictossell/nixflakes/tree/main/hosts)/[`users`](https://github.com/erictossell/nixflakes/tree/main/users) at [`sh/build.sh`](https://github.com/erictossell/nixflakes/blob/main/sh/build.sh)

#### 4. [`eriixvim`](https://github.com/erictossell/eriixvim) - a fully reproducible neovim configuration built with [`nixvim`](https://github.com/nix-community/nixvim).

Try it out with:

```nix
nix run github:erictossell/eriixvim
```

#### 5. A simple example of a custom built `rust` package: [`russh`](https://github.com/erictossell/russh). 

The highlight being how simple it is to package any application with `flakes` and import them into a `configuration` and ***not*** my `rust` code.

#### 6. Semi up to date diagrams of the [structure](https://github.com/erictossell/nixflakes/blob/main/docs/screens/FlakeStructure8.png) of this flake and the [configurations](https://github.com/erictossell/nixflakes/blob/main/docs/screens/FlakeProfiles8.png) managed by [me](https://github.com/erictossell).

#### 7. Places I run this `flake`:
```md
    principium  - My Desktop with full virtualisation capabilities.
    sisyphus    - My laptop as a default baseline for the flake.
    live-image  - Customized Installation Media
    winix       - My WSL `NixOS` configuration.
```

#### 8. [Nix CI/CD with Github Actions](https://github.com/erictossell/nixflakes/blob/main/.github/workflows/flake_check.yml) - Built with: [Cachix - Install Nix](https://github.com/cachix/install-nix-action), [Determiniate Systems - Flake Check](https://github.com/DeterminateSystems/flake-checker-action), [stefanzweifel - Commit Action](https://github.com/stefanzweifel/git-auto-commit-action), [statix](https://github.com/nerdypepper/statix), [nixpkgs-fmt](https://github.com/nix-community/nixpkgs-fmt)

## Flake Structure
Modules are grouped to be ***almost*** purely *functional* and as a result you will often find both the system configuration and the home-manager configuration in the same place. Not all NixOS users use this paradigm.

This repo has become more opinionated over time and now requires passing down variables from the `flake.nix` in order to fetch appropriate `host` and `user` specific configurations for a given device.

### Flake Github URLS

Transparency is cool.

| Input | Following |
| --- | --- |
| nixpkgs | [nixos-unstable](https://github.com/NixOS/nixpkgs) |
| home-manager | [following nixpkgs](https://github.com/nix-community/home-manager/blob/master/flake.nix) |
| agenix | [following nixpkgs](https://github.com/ryantm/agenix/blob/main/flake.nix) |
| [hyprland](https://github.com/hyprwm/Hyprland/blob/main/flake.nix)| [nixos-unstable](https://github.com/NixOS/nixpkgs)| 
| eriixvim [my nixvim flake](https://github.com/erictossell/eriixvim/blob/main/flake.nix) | [nixos-unstable](https://github.com/NixOS/nixpkgs)|
| [ruSSH: a simple SSH multiplier](https://github.com/erictossell/russh/blob/main/flake.nix) | [nixos-unstable](https://github.com/NixOS/nixpkgs) |

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
