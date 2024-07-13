> :warning: **I am not an authority on `Nix` or `NixOS`. I am merely an apprentice, an *Alice* navigating the *wonderland*. At least for now.**

So anyways. Here's my dots. I hope you like them.


# Eriim's Nixflakes

[![Flake Check](https://github.com/erictossell/nixflakes/actions/workflows/flake_check.yml/badge.svg)](https://github.com/erictossell/nixflakes/actions/workflows/flake_check.yml)

```
There are many paths to the top of the mountain, but the view is always the same.
```

<details>
<summary> 📚 Docs </summary>

[Why Nix and NixOS](docs/why-nix.md)

[Getting Started with NixOS Minimal](docs/minimal-install.md)

[How to use this repo](docs/usage.md)

[NixOS as a Hypervisor](docs/hypervisor.md)

[Keybindings Implemented by this Configuration](docs/keybinds.md) 

If you have questions you are welcome to send them in the form of an [issue](https://github.com/erictossell/nixflakes/issues/new) or reach me at any of my other points of contact available on my [GitHub Profile](https://github.com/erictossell) - I make no guarantees but I'm happy to do my best.

</details>

<details>
<summary>📁 What is in this repo?</summary>

1. A [modular](https://github.com/erictossell/nixflakes/blob/main/docs/screens/FlakeStructure9.png) (opinionated) Configuration Structure

2. Flake templates - Quickly grab this configuration and make it your own with:

```nix
nix flake new -t github:erictossell/nixflakes ./<your-repo-name-here>
```

3. An interactive build script for adding new [`hosts`](https://github.com/erictossell/nixflakes/tree/main/hosts)/[`users`](https://github.com/erictossell/nixflakes/tree/main/users) at [`sh/build.sh`](https://github.com/erictossell/nixflakes/blob/main/sh/build.sh)

4. [`eriixvim`](https://github.com/erictossell/eriixvim) - a fully reproducible neovim configuration built with [`nixvim`](https://github.com/nix-community/nixvim).

Try it out with:

```nix
nix run github:erictossell/eriixvim
```

5. A simple example of a custom built `rust` package: [`russh`](https://github.com/erictossell/russh). 

The highlight being how simple it is to package any application with `flakes` and import them into a `configuration` and ***not*** my `rust` code.

6. Semi up-to-date diagrams of the [structure](https://github.com/erictossell/nixflakes/blob/main/docs/screens/FlakeStructure9.png) of this flake and the [configurations](https://github.com/erictossell/nixflakes/blob/main/docs/screens/FlakeProfiles9.png) managed by [me](https://github.com/erictossell).


7. [Nix CI/CD with Github Actions](https://github.com/erictossell/nixflakes/blob/main/.github/workflows/flake_check.yml) - Built with: [Cachix - Install Nix](https://github.com/cachix/install-nix-action), [Determiniate Systems - Flake Check](https://github.com/DeterminateSystems/flake-checker-action), [stefanzweifel - Commit Action](https://github.com/stefanzweifel/git-auto-commit-action), [statix](https://github.com/nerdypepper/statix), [nixpkgs-fmt](https://github.com/nix-community/nixpkgs-fmt)

</details>

## Flake Structure
Modules are grouped to be ***almost*** purely *functional* and as a result you will often find both the system configuration and the home-manager configuration in the same place. Not all NixOS users use this paradigm.

This repo has become more opinionated over time and now requires passing down variables from the `flake.nix` in order to fetch appropriate `host` and `user` specific configurations for a given device.

<details>
<summary> Generated Flake Information </summary>



### Flake Info

```nix
Resolved URL:  git+file:///home/runner/work/nixflakes/nixflakes?shallow=1
Locked URL:    git+file:///home/runner/work/nixflakes/nixflakes?rev=44dc7fd200efea8a349329c7b34d8f4381e01de4&shallow=1
Description:   Eriim's machine specific configuration flake.
Path:          /nix/store/68swzriasabnvrf56f1y06k085mk1rrn-source
Revision:      44dc7fd200efea8a349329c7b34d8f4381e01de4
Revisions:     1
Last modified: 2024-07-13 20:30:32
Inputs:
├───NixOS-WSL: github:nix-community/NixOS-WSL/371b5076d718f7f637d3959d0203061f06af1263 (2024-07-12 12:23:35)
│   ├───flake-compat: github:edolstra/flake-compat/0f9255e01c2351cc7d116c072cb317785dd33b33 (2023-10-04 13:37:54)
│   ├───flake-utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   └───nixpkgs follows input 'nixpkgs'
├───agenix: github:ryantm/agenix/de96bd907d5fbc3b14fc33ad37d1b9a3cb15edc6 (2024-07-09 17:30:05)
│   ├───darwin follows input ''
│   ├───home-manager: github:nix-community/home-manager/3bfaacf46133c037bb356193bd2f1765d9dc82c1 (2023-12-20 23:00:17)
│   │   └───nixpkgs follows input 'agenix/nixpkgs'
│   ├───nixpkgs follows input 'nixpkgs'
│   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
├───eriixpkgs: github:erictossell/eriixpkgs/bed61a55ce339f70f64f18daeab06f5fef98d076 (2024-07-13 20:29:46)
│   ├───eriixvim: github:erictossell/eriixvim/a94ec39e05c54b978935ba2b3ef1709bb0bd5651 (2024-07-13 20:29:33)
│   │   ├───flake-parts: github:hercules-ci/flake-parts/9227223f6d922fee3c7b190b2cc238a99527bbb7 (2024-07-03 08:15:18)
│   │   │   └───nixpkgs-lib: https://github.com/NixOS/nixpkgs/archive/5daf0514482af3f97abaefc78a6606365c9108e2.tar.gz?narHash=sha256-Fm2rDDs86sHy0/1jxTOKB1118Q0O3Uc7EC0iXvXKpbI%3D (2024-07-01 23:35:45)
│   │   ├───nixpkgs: github:nixos/nixpkgs/7e7c39ea35c5cdd002cd4588b03a3fb9ece6fad9 (2024-07-12 07:14:11)
│   │   └───nixvim: github:nix-community/nixvim/06a44e9e8814ab13ea013e222637a497a50e96e4 (2024-07-13 19:20:51)
│   │       ├───devshell: github:numtide/devshell/1ebbe68d57457c8cae98145410b164b5477761f4 (2024-06-03 10:02:49)
│   │       │   ├───flake-utils: github:numtide/flake-utils/4022d587cbbfd70fe950c1e2083a02621806a725 (2023-12-04 08:58:27)
│   │       │   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │       │   └───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       ├───flake-compat: https://api.flakehub.com/f/pinned/edolstra/flake-compat/1.0.1/018afb31-abd1-7bff-a5e4-cff7e18efb7a/source.tar.gz?narHash=sha256-kvjfFW7WAETZlt09AgDn1MrtKzP7t90Vf7vypd3OL1U%3D (2023-10-04 13:37:54)
│   │       ├───flake-parts: github:hercules-ci/flake-parts/4e3583423212f9303aa1a6337f8dffb415920e4f (2024-07-01 23:44:14)
│   │       │   └───nixpkgs-lib follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       ├───git-hooks: github:cachix/git-hooks.nix/0ff4381bbb8f7a52ca4a851660fc7a437a4c6e07 (2024-06-24 20:12:25)
│   │       │   ├───flake-compat follows input 'eriixpkgs/eriixvim/nixvim/flake-compat'
│   │       │   ├───gitignore: github:hercules-ci/gitignore.nix/637db329424fd7e46cf4185293b9cc8c88c95394 (2024-02-28 02:28:52)
│   │       │   │   └───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/git-hooks/nixpkgs'
│   │       │   ├───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       │   └───nixpkgs-stable follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       ├───home-manager: github:nix-community/home-manager/59ce796b2563e19821361abbe2067c3bb4143a7d (2024-07-01 09:50:39)
│   │       │   └───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       ├───nix-darwin: github:lnl7/nix-darwin/ec12b88104d6c117871fad55e931addac4626756 (2024-07-01 14:50:23)
│   │       │   └───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       ├───nixpkgs: github:NixOS/nixpkgs/00d80d13810dbfea8ab4ed1009b09100cca86ba8 (2024-07-01 15:47:52)
│   │       └───treefmt-nix: github:numtide/treefmt-nix/bdb6355009562d8f9313d9460c0d3860f525bc6c (2024-07-02 02:35:53)
│   │           └───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   ├───flake-utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   ├───go-time: github:erictossell/go-time/9500af69843fc74ca86b686506bc7d2f0490d0c4 (2024-07-07 23:19:03)
│   │   └───nixpkgs: github:NixOS/nixpkgs/9f4128e00b0ae8ec65918efeba59db998750ead6 (2024-07-03 18:27:49)
│   ├───homepage-nix: github:erictossell/homepage-nix/540adeb9f307826c9bdd1b047a8b4467160709a4 (2024-07-05 04:49:49)
│   │   ├───naersk: github:nix-community/naersk/941ce6dc38762a7cfb90b5add223d584feed299b (2024-06-18 16:21:15)
│   │   │   └───nixpkgs: path:/nix/store/dk2rpyb6ndvfbf19bkb2plcz5y3k8i5v-source?lastModified=0&narHash=sha256-rwz8NJZV%2B387rnWpTYcXaRNvzUSnnF9aHONoJIYmiUQ%3D (1970-01-01 00:00:00)
│   │   ├───nixpkgs: github:NixOS/nixpkgs/1afc5440469f94e7ed26e8648820971b102afdc3 (2024-07-04 10:07:58)
│   │   └───utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│   │       └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   ├───nixpkgs follows input 'nixpkgs'
│   ├───readme-py: github:erictossell/readme-py/fb10275a3e38114828f1b4b01c5d861b55ed9c91 (2024-07-07 00:12:51)
│   │   ├───flake-utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│   │   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │   ├───nixpkgs: github:NixOS/nixpkgs/9f4128e00b0ae8ec65918efeba59db998750ead6 (2024-07-03 18:27:49)
│   │   └───poetry2nix: github:nix-community/poetry2nix/42262f382c68afab1113ebd1911d0c93822d756e (2024-07-01 16:21:24)
│   │       ├───flake-utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│   │       │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │       ├───nix-github-actions: github:nix-community/nix-github-actions/5163432afc817cf8bd1f031418d1869e4c9d5547 (2023-12-29 15:30:25)
│   │       │   └───nixpkgs follows input 'eriixpkgs/readme-py/poetry2nix/nixpkgs'
│   │       ├───nixpkgs follows input 'eriixpkgs/readme-py/nixpkgs'
│   │       ├───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │       └───treefmt-nix: github:numtide/treefmt-nix/8df5ff62195d4e67e2264df0b7f5e8c9995fd0bd (2024-06-30 12:03:42)
│   │           └───nixpkgs follows input 'eriixpkgs/readme-py/poetry2nix/nixpkgs'
│   └───russh: github:erictossell/russh/45da95e1260fe25cd7145a23e4111d84b5b8ef7f (2024-07-05 04:45:21)
│       ├───naersk: github:nix-community/naersk/941ce6dc38762a7cfb90b5add223d584feed299b (2024-06-18 16:21:15)
│       │   └───nixpkgs: path:/nix/store/dk2rpyb6ndvfbf19bkb2plcz5y3k8i5v-source?lastModified=0&narHash=sha256-rwz8NJZV%2B387rnWpTYcXaRNvzUSnnF9aHONoJIYmiUQ%3D (1970-01-01 00:00:00)
│       ├───nixpkgs: github:NixOS/nixpkgs/1afc5440469f94e7ed26e8648820971b102afdc3 (2024-07-04 10:07:58)
│       └───utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│           └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
├───home-manager: github:nix-community/home-manager/90ae324e2c56af10f20549ab72014804a3064c7f (2024-07-11 21:48:33)
│   └───nixpkgs follows input 'nixpkgs'
├───hyprland: git+https://github.com/hyprwm/Hyprland?ref=refs/heads/main&rev=bc6b0880dda2607a80f000c134f573c970452a0f&submodules=1 (2024-07-13 18:44:32)
│   ├───hyprcursor: github:hyprwm/hyprcursor/a5c0d57325c5f0814c39110a70ca19c070ae9486 (2024-07-04 15:59:59)
│   │   ├───hyprlang follows input 'hyprland/hyprlang'
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprlang: github:hyprwm/hyprlang/5df0174fd09de4ac5475233d65ffc703e89b82eb (2024-07-07 19:42:53)
│   │   ├───hyprutils follows input 'hyprland/hyprutils'
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprutils: github:hyprwm/hyprutils/6174a2a25f4e216c0f1d0c4278adc23c476b1d09 (2024-07-09 17:11:16)
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprwayland-scanner: github:hyprwm/hyprwayland-scanner/d5fa094ca27e0039be5e94c0a80ae433145af8bb (2024-07-05 21:44:17)
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───nixpkgs: github:NixOS/nixpkgs/feb2849fdeb70028c70d73b848214b00d324a497 (2024-07-09 16:33:20)
│   ├───systems: github:nix-systems/default-linux/31732fcf5e8fea42e59c2488ad31a0e651500f68 (2023-07-14 15:19:09)
│   └───xdph: github:hyprwm/xdg-desktop-portal-hyprland/b9b97e5ba23fe7bd5fa4df54696102e8aa863cf6 (2024-07-05 15:47:46)
│       ├───hyprland-protocols: github:hyprwm/hyprland-protocols/1b61f0093afff20ab44d88ad707aed8bf2215290 (2024-06-18 21:31:54)
│       │   ├───nixpkgs follows input 'hyprland/xdph/nixpkgs'
│       │   └───systems follows input 'hyprland/xdph/systems'
│       ├───hyprlang follows input 'hyprland/hyprlang'
│       ├───nixpkgs follows input 'hyprland/nixpkgs'
│       └───systems follows input 'hyprland/systems'
├───hyprlock: github:hyprwm/hyprlock/b407128caeb551ae808cf8d0fb653a252a271709 (2024-07-11 14:15:32)
│   ├───hyprlang: github:hyprwm/hyprlang/ec6938c66253429192274d612912649a0cfe4d28 (2024-06-08 21:24:12)
│   │   ├───hyprutils follows input 'hyprlock/hyprutils'
│   │   ├───nixpkgs follows input 'hyprlock/nixpkgs'
│   │   └───systems follows input 'hyprlock/systems'
│   ├───hyprutils: github:hyprwm/hyprutils/0693f9398ab693d89c9a0aa3b3d062dd61b7a60e (2024-06-08 21:15:34)
│   │   ├───nixpkgs follows input 'hyprlock/nixpkgs'
│   │   └───systems follows input 'hyprlock/systems'
│   ├───nixpkgs follows input 'nixpkgs'
│   └───systems: github:nix-systems/default-linux/31732fcf5e8fea42e59c2488ad31a0e651500f68 (2023-07-14 15:19:09)
├───hyprpicker: github:hyprwm/hyprpicker/b0974381f996f92dc191e6b03adf7d581061619b (2024-07-01 22:45:34)
│   └───nixpkgs follows input 'nixpkgs'
└───nixpkgs: github:NixOS/nixpkgs/7e7c39ea35c5cdd002cd4588b03a3fb9ece6fad9 (2024-07-12 07:14:11)

```

### Flake Outputs

```nix
git+file:///home/runner/work/nixflakes/nixflakes?rev=44dc7fd200efea8a349329c7b34d8f4381e01de4&shallow=1
├───devShells
│   └───x86_64-linux
│       └───default: development environment 'nix-shell'
├───formatter
│   └───x86_64-linux: package 'nixfmt-unstable-2024-07-03'
├───nixosConfigurations
│   ├───arkhitekton: NixOS configuration
│   ├───live-image: NixOS configuration
│   ├───terminus: NixOS configuration
│   ├───vm-temp: NixOS configuration
│   └───winix: NixOS configuration
└───templates
    └───default: template: The default template for Eriim's nixflakes.

```


</details>


<details>
<summary>📊 Diagrams</summary>

![Flake Structure](docs/screens/FlakeStructure10.png)

![Flake Profiles](docs/screens/FlakeProfiles10.png)

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
