> :warning: **I am not an authority on `Nix` or `NixOS`. I am merely an apprentice, an *Alice* navigating the *wonderland*. At least for now.**

So anyways. Here's my dots. I hope you like them.


# Eriim's Nixflakes

[![Flake Check](https://github.com/erictossell/nixflakes/actions/workflows/flake_check.yml/badge.svg)](https://github.com/erictossell/nixflakes/actions/workflows/flake_check.yml)

```
There are many paths to the top of the mountain, but the view is always the same.
```

[How to use this repo](docs/usage.md)

[Getting Started with NixOS Minimal](docs/minimal-install.md)

[Why Nix and NixOS](docs/why-nix.md)

Got questions? Send them in the form of an [issue](https://github.com/erictossell/nixflakes/issues/new) or reach me at any of my other points of contact available on my [GitHub Profile](https://github.com/erictossell) - I make no guarantees but I'm happy to do my best.

<details>
<summary>📁 What is in this repo?</summary>

#### 1. A [modular](https://github.com/erictossell/nixflakes/blob/main/docs/screens/FlakeStructure9.png) (opinionated) Configuration Structure

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

#### 6. Semi up-to-date diagrams of the [structure](https://github.com/erictossell/nixflakes/blob/main/docs/screens/FlakeStructure9.png) of this flake and the [configurations](https://github.com/erictossell/nixflakes/blob/main/docs/screens/FlakeProfiles9.png) managed by [me](https://github.com/erictossell).

#### 7. `nix flake show github:erictossell/nixflakes` 

```nix
github:erictossell/nixflakes/bbca96ce85416b025d652d752c87d3816b2bf8ad
├───devShells
│   └───x86_64-linux
│       └───default: development environment 'nix-shell'
├───formatter
│   └───x86_64-linux: package 'nixpkgs-fmt-1.3.0'
├───nixosConfigurations
│   ├───ambiens: NixOS configuration
│   ├───live-image: NixOS configuration
│   ├───principium: NixOS configuration
│   ├───sisyphus: NixOS configuration
│   ├───virtualis: NixOS configuration
│   └───winix: NixOS configuration
└───templates
    └───default: template: The default template for Eriim's nixflakes.
```

#### 8. [Nix CI/CD with Github Actions](https://github.com/erictossell/nixflakes/blob/main/.github/workflows/flake_check.yml) - Built with: [Cachix - Install Nix](https://github.com/cachix/install-nix-action), [Determiniate Systems - Flake Check](https://github.com/DeterminateSystems/flake-checker-action), [stefanzweifel - Commit Action](https://github.com/stefanzweifel/git-auto-commit-action), [statix](https://github.com/nerdypepper/statix), [nixpkgs-fmt](https://github.com/nix-community/nixpkgs-fmt)

</details>

## Flake Structure
Modules are grouped to be ***almost*** purely *functional* and as a result you will often find both the system configuration and the home-manager configuration in the same place. Not all NixOS users use this paradigm.

This repo has become more opinionated over time and now requires passing down variables from the `flake.nix` in order to fetch appropriate `host` and `user` specific configurations for a given device.

<details>
<summary> Generated Flake Information </summary>



### Flake Info

```nix
Resolved URL:  git+file:///home/runner/work/nixflakes/nixflakes?shallow=1
Locked URL:    git+file:///home/runner/work/nixflakes/nixflakes?ref=f5f962943c9850a47dd36470daceef2ae1dad95d&rev=f5f962943c9850a47dd36470daceef2ae1dad95d&shallow=1
Description:   Eriim's machine specific configuration flake.
Path:          /nix/store/flr7f242jlj2wq34jiibhg2h3708gfnw-source
Revision:      f5f962943c9850a47dd36470daceef2ae1dad95d
Last modified: 2024-02-08 01:11:49
Inputs:
├───NixOS-WSL: github:nix-community/NixOS-WSL/4bb6b2e814be63caa115038e917c6c25b7fc2ac1
│   ├───flake-compat: github:edolstra/flake-compat/0f9255e01c2351cc7d116c072cb317785dd33b33
│   ├───flake-utils: github:numtide/flake-utils/1ef2e671c3b0c19053962c07dbda38332dcebf26
│   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e
│   └───nixpkgs follows input 'nixpkgs'
├───agenix: github:ryantm/agenix/417caa847f9383e111d1397039c9d4337d024bf0
│   ├───darwin follows input ''
│   ├───home-manager: github:nix-community/home-manager/3bfaacf46133c037bb356193bd2f1765d9dc82c1
│   │   └───nixpkgs follows input 'agenix/nixpkgs'
│   ├───nixpkgs follows input 'nixpkgs'
│   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e
├───eriixpkgs: github:erictossell/eriixpkgs/517296fb45fabd701480f38d505e0b78d8855523
│   ├───eriixvim: github:erictossell/eriixvim/ece21a27b2a9dc00ab68bc432b458faafb940756
│   │   ├───flake-parts: github:hercules-ci/flake-parts/b253292d9c0a5ead9bc98c4e9a26c6312e27d69f
│   │   │   └───nixpkgs-lib: github:NixOS/nixpkgs/97b17f32362e475016f942bbdfda4a4a72a8a652?dir=lib
│   │   ├───nixpkgs: github:nixos/nixpkgs/e92b6015881907e698782c77641aa49298330223
│   │   └───nixvim: github:nix-community/nixvim/a181b63aaf6431641690573723d6d2649b1cc53f
│   │       ├───flake-parts: github:hercules-ci/flake-parts/b253292d9c0a5ead9bc98c4e9a26c6312e27d69f
│   │       │   └───nixpkgs-lib follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       ├───home-manager: github:nix-community/home-manager/880d9bc2110f7cae59698f715b8ca42cdc53670c
│   │       │   └───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       ├───nix-darwin: github:lnl7/nix-darwin/bdbae6ecff8fcc322bf6b9053c0b984912378af7
│   │       │   └───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       ├───nixpkgs: github:NixOS/nixpkgs/b8b232ae7b8b144397fdb12d20f592e5e7c1a64d
│   │       └───pre-commit-hooks: github:cachix/pre-commit-hooks.nix/7c54e08a689b53c8a1e5d70169f2ec9e2a68ffaf
│   │           ├───flake-compat: github:edolstra/flake-compat/0f9255e01c2351cc7d116c072cb317785dd33b33
│   │           ├───flake-utils: github:numtide/flake-utils/4022d587cbbfd70fe950c1e2083a02621806a725
│   │           │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e
│   │           ├───gitignore: github:hercules-ci/gitignore.nix/43e1aa1308018f37118e34d3a9cb4f5e75dc11d5
│   │           │   └───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/pre-commit-hooks/nixpkgs'
│   │           ├───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │           └───nixpkgs-stable follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   ├───flake-utils: github:numtide/flake-utils/1ef2e671c3b0c19053962c07dbda38332dcebf26
│   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e
│   ├───go-time: github:erictossell/go-time/d2e5a8c286fde94478e16a597bc78b6954e3b9a8
│   │   └───nixpkgs: github:NixOS/nixpkgs/c3e128f3c0ecc1fb04aef9f72b3dcc2f6cecf370
│   ├───homepage-nix: github:erictossell/homepage-nix/7895b342647955e8572363bbbfb331d15255dd48
│   │   ├───naersk: github:nix-community/naersk/aeb58d5e8faead8980a807c840232697982d47b9
│   │   │   └───nixpkgs: github:NixOS/nixpkgs/e5d1c87f5813afde2dda384ac807c57a105721cc
│   │   ├───nixpkgs: github:NixOS/nixpkgs/e5d1c87f5813afde2dda384ac807c57a105721cc
│   │   └───utils: github:numtide/flake-utils/1ef2e671c3b0c19053962c07dbda38332dcebf26
│   │       └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e
│   ├───nixpkgs follows input 'nixpkgs'
│   ├───readme-py: github:erictossell/readme-py/bb3e80e2a8205d915cfc38ed2b4f2951443b0024
│   │   ├───flake-utils: github:numtide/flake-utils/1ef2e671c3b0c19053962c07dbda38332dcebf26
│   │   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e
│   │   ├───nixpkgs: github:NixOS/nixpkgs/b8b232ae7b8b144397fdb12d20f592e5e7c1a64d
│   │   └───poetry2nix: github:nix-community/poetry2nix/e0b44e9e2d3aa855d1dd77b06f067cd0e0c3860d
│   │       ├───flake-utils: github:numtide/flake-utils/ff7b65b44d01cf9ba6a71320833626af21126384
│   │       │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e
│   │       ├───nix-github-actions: github:nix-community/nix-github-actions/4bb5e752616262457bc7ca5882192a564c0472d2
│   │       │   └───nixpkgs follows input 'eriixpkgs/readme-py/poetry2nix/nixpkgs'
│   │       ├───nixpkgs follows input 'eriixpkgs/readme-py/nixpkgs'
│   │       ├───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e
│   │       └───treefmt-nix: github:numtide/treefmt-nix/e82f32aa7f06bbbd56d7b12186d555223dc399d1
│   │           └───nixpkgs follows input 'eriixpkgs/readme-py/poetry2nix/nixpkgs'
│   └───russh: github:erictossell/russh/948dfb643c24c0f029d9917c0fd665b97ade3926
│       ├───naersk: github:nix-community/naersk/aeb58d5e8faead8980a807c840232697982d47b9
│       │   └───nixpkgs: github:NixOS/nixpkgs/e5d1c87f5813afde2dda384ac807c57a105721cc
│       ├───nixpkgs: github:NixOS/nixpkgs/e5d1c87f5813afde2dda384ac807c57a105721cc
│       └───utils: github:numtide/flake-utils/1ef2e671c3b0c19053962c07dbda38332dcebf26
│           └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e
├───home-manager: github:nix-community/home-manager/f99eace7c167b8a6a0871849493b1c613d0f1b80
│   └───nixpkgs follows input 'nixpkgs'
├───hyprland: github:hyprwm/hyprland/ded174d6e5d14bc376919194cbc52c238a07f640
│   ├───hyprland-protocols: github:hyprwm/hyprland-protocols/0c2ce70625cb30aef199cb388f99e19a61a6ce03
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───nixpkgs: github:NixOS/nixpkgs/ae5c332cbb5827f6b1f02572496b141021de335f
│   ├───systems: github:nix-systems/default-linux/31732fcf5e8fea42e59c2488ad31a0e651500f68
│   ├───wlroots: gitlab:wlroots/wlroots/00b869c1a96f300a8f25da95d624524895e0ddf2
│   └───xdph: github:hyprwm/xdg-desktop-portal-hyprland/5a592647587cd20b9692a347df6939b6d371b3bb
│       ├───hyprland-protocols follows input 'hyprland/hyprland-protocols'
│       ├───hyprlang: github:hyprwm/hyprlang/6624f2bb66d4d27975766e81f77174adbe58ec97
│       │   └───nixpkgs follows input 'hyprland/xdph/nixpkgs'
│       ├───nixpkgs follows input 'hyprland/nixpkgs'
│       └───systems follows input 'hyprland/systems'
├───hyprpicker: github:hyprwm/hyprpicker/2ef703474fb96e97e03e66e8820f213359f29382
│   └───nixpkgs follows input 'nixpkgs'
└───nixpkgs: github:NixOS/nixpkgs/faf912b086576fd1a15fca610166c98d47bc667e

```

### Flake Outputs

```nix
git+file:///home/runner/work/nixflakes/nixflakes?ref=f5f962943c9850a47dd36470daceef2ae1dad95d&rev=f5f962943c9850a47dd36470daceef2ae1dad95d&shallow=1
├───devShells
│   └───x86_64-linux
│       └───default: development environment 'nix-shell'
├───formatter
│   └───x86_64-linux: package 'nixpkgs-fmt-1.3.0'
├───nixosConfigurations
│   ├───ambiens: NixOS configuration
│   ├───live-image: NixOS configuration
│   ├───principium: NixOS configuration
│   ├───sisyphus: NixOS configuration
│   ├───virtualis: NixOS configuration
│   └───winix: NixOS configuration
└───templates
    └───default: template: The default template for Eriim's nixflakes.

```


</details>


<details>
<summary>📊 Diagrams</summary>

![Flake Structure](docs/screens/FlakeStructure9.png)

![Flake Profiles](docs/screens/FlakeProfiles9.png)

</details> 

<details>
<summary>📸 Screenshots</summary>

Current 
------
![Hyprland](docs/screens/hyprland4.png)
![Hyprland](docs/screens/hyprland5.png)

October 2023
------
![Hyprland](docs/screens/hyprland1.png)

![Hyprland1](docs/screens/hyprland2.png)

![Hyprland3](docs/screens/hyprland3.png)

</details>

[How to use this repo](docs/usage.md)

[Getting Started with NixOS Minimal](docs/minimal-install.md)
