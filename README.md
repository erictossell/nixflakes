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
Locked URL:    git+file:///home/runner/work/nixflakes/nixflakes?rev=78ba636c54725dfc4cbe55fa313889b9986a0388&shallow=1
Description:   Eriim's machine specific configuration flake.
Path:          /nix/store/7d3pc3vijs0xg1gadvnk40ziydr81m18-source
Revision:      78ba636c54725dfc4cbe55fa313889b9986a0388
Revisions:     1
Last modified: 2024-05-02 22:45:09
Inputs:
├───NixOS-WSL: github:nix-community/NixOS-WSL/acb893461a4bee4e77b1a27b1410d4995b52174c (2024-04-29 01:58:16)
│   ├───flake-compat: github:edolstra/flake-compat/0f9255e01c2351cc7d116c072cb317785dd33b33 (2023-10-04 13:37:54)
│   ├───flake-utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   └───nixpkgs follows input 'nixpkgs'
├───agenix: github:ryantm/agenix/24a7ea390564ccd5b39b7884f597cfc8d7f6f44e (2024-04-26 12:59:12)
│   ├───darwin follows input ''
│   ├───home-manager: github:nix-community/home-manager/3bfaacf46133c037bb356193bd2f1765d9dc82c1 (2023-12-20 23:00:17)
│   │   └───nixpkgs follows input 'agenix/nixpkgs'
│   ├───nixpkgs follows input 'nixpkgs'
│   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
├───eriixpkgs: github:erictossell/eriixpkgs/76d40f1792218107e43df2e08f6f34848085d97a (2024-04-30 21:47:32)
│   ├───eriixvim: github:erictossell/eriixvim/9b5d73b84fa3bd2f9e75bd6c6afc53ea93f480d5 (2024-04-30 21:42:18)
│   │   ├───flake-parts: github:hercules-ci/flake-parts/9126214d0a59633752a136528f5f3b9aa8565b7d (2024-04-01 23:40:58)
│   │   │   └───nixpkgs-lib: github:NixOS/nixpkgs/d8fe5e6c92d0d190646fb9f1056741a229980089?dir=lib (2024-03-29 09:07:56)
│   │   ├───nixpkgs: github:nixos/nixpkgs/58a1abdbae3217ca6b702f03d3b35125d88a2994 (2024-04-27 21:35:43)
│   │   └───nixvim: github:nix-community/nixvim/2483dff03dd326296278213a8e051d375b56d3df (2024-04-30 16:36:11)
│   │       ├───devshell: github:numtide/devshell/12e914740a25ea1891ec619bb53cf5e6ca922e40 (2024-04-19 13:19:58)
│   │       │   ├───flake-utils: github:numtide/flake-utils/4022d587cbbfd70fe950c1e2083a02621806a725 (2023-12-04 08:58:27)
│   │       │   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │       │   └───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       ├───flake-compat: https://api.flakehub.com/f/pinned/edolstra/flake-compat/1.0.1/018afb31-abd1-7bff-a5e4-cff7e18efb7a/source.tar.gz?narHash=sha256-kvjfFW7WAETZlt09AgDn1MrtKzP7t90Vf7vypd3OL1U%3D (2023-10-04 13:37:54)
│   │       ├───flake-parts: github:hercules-ci/flake-parts/9126214d0a59633752a136528f5f3b9aa8565b7d (2024-04-01 23:40:58)
│   │       │   └───nixpkgs-lib follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       ├───home-manager: github:nix-community/home-manager/9fe79591c1005ce6f93084ae7f7dab0a2891440d (2024-04-28 22:30:45)
│   │       │   └───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       ├───nix-darwin: github:lnl7/nix-darwin/230a197063de9287128e2c68a7a4b0cd7d0b50a7 (2024-04-24 08:09:31)
│   │       │   └───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       ├───nixpkgs: github:NixOS/nixpkgs/58a1abdbae3217ca6b702f03d3b35125d88a2994 (2024-04-27 21:35:43)
│   │       └───pre-commit-hooks: github:cachix/pre-commit-hooks.nix/6fb82e44254d6a0ece014ec423cb62d92435336f (2024-04-24 10:34:06)
│   │           ├───flake-compat: github:edolstra/flake-compat/0f9255e01c2351cc7d116c072cb317785dd33b33 (2023-10-04 13:37:54)
│   │           ├───flake-utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│   │           │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │           ├───gitignore: github:hercules-ci/gitignore.nix/637db329424fd7e46cf4185293b9cc8c88c95394 (2024-02-28 02:28:52)
│   │           │   └───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/pre-commit-hooks/nixpkgs'
│   │           ├───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │           └───nixpkgs-stable follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   ├───flake-utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   ├───go-time: github:erictossell/go-time/18e4d069522a1ad1e65223ec95daed4baeae5f71 (2024-04-30 21:46:46)
│   │   └───nixpkgs: github:NixOS/nixpkgs/58a1abdbae3217ca6b702f03d3b35125d88a2994 (2024-04-27 21:35:43)
│   ├───homepage-nix: github:erictossell/homepage-nix/c6620260812bc35ee7209ab2fa0f4899868b86f1 (2024-03-08 02:17:42)
│   │   ├───naersk: github:nix-community/naersk/aeb58d5e8faead8980a807c840232697982d47b9 (2023-10-27 15:31:12)
│   │   │   └───nixpkgs: github:NixOS/nixpkgs/f945939fd679284d736112d3d5410eb867f3b31c (2024-03-07 02:56:54)
│   │   ├───nixpkgs: github:NixOS/nixpkgs/f945939fd679284d736112d3d5410eb867f3b31c (2024-03-07 02:56:54)
│   │   └───utils: github:numtide/flake-utils/d465f4819400de7c8d874d50b982301f28a84605 (2024-02-28 13:18:44)
│   │       └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   ├───nixpkgs follows input 'nixpkgs'
│   ├───readme-py: github:erictossell/readme-py/4cf6b922f5deb3cc9b791d6b6252ba653cbce804 (2024-04-30 21:42:26)
│   │   ├───flake-utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│   │   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │   ├───nixpkgs: github:NixOS/nixpkgs/58a1abdbae3217ca6b702f03d3b35125d88a2994 (2024-04-27 21:35:43)
│   │   └───poetry2nix: github:nix-community/poetry2nix/184960be60652ca7f865123e8394ece988afb566 (2024-04-30 20:37:07)
│   │       ├───flake-utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│   │       │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │       ├───nix-github-actions: github:nix-community/nix-github-actions/5163432afc817cf8bd1f031418d1869e4c9d5547 (2023-12-29 15:30:25)
│   │       │   └───nixpkgs follows input 'eriixpkgs/readme-py/poetry2nix/nixpkgs'
│   │       ├───nixpkgs follows input 'eriixpkgs/readme-py/nixpkgs'
│   │       ├───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │       └───treefmt-nix: github:numtide/treefmt-nix/c6aaf729f34a36c445618580a9f95a48f5e4e03f (2024-04-25 15:24:16)
│   │           └───nixpkgs follows input 'eriixpkgs/readme-py/poetry2nix/nixpkgs'
│   └───russh: github:erictossell/russh/dd53274d43199a67f9d192d88b6f77807363657b (2024-04-30 21:45:16)
│       ├───naersk: github:nix-community/naersk/c5037590290c6c7dae2e42e7da1e247e54ed2d49 (2024-04-19 09:58:44)
│       │   └───nixpkgs: path:/nix/store/370qy3d3wg9zhbn5a3dcv6k1q1iigfh4-source?lastModified=0&narHash=sha256-Drmja/f5MRHZCskS6mvzFqxEaZMeciScCTFxWVLqWEY%3D (1970-01-01 00:00:00)
│       ├───nixpkgs: github:NixOS/nixpkgs/cf8cc1201be8bc71b7cbbbdaf349b22f4f99c7ae (2024-04-28 14:22:29)
│       └───utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│           └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
├───home-manager: github:nix-community/home-manager/f8e6694edabe4aaa7a85aac47b43ea5d978b116d (2024-04-29 22:41:45)
│   └───nixpkgs follows input 'nixpkgs'
├───hyprland: github:hyprwm/hyprland/70ebc3add3b941a52f460f02129ef0842f580ec7 (2024-04-30 20:59:07)
│   ├───hyprcursor: github:hyprwm/hyprcursor/cab4746180f210a3c1dd3d53e45c510e309e90e1 (2024-04-20 11:23:33)
│   │   ├───hyprlang follows input 'hyprland/hyprlang'
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprland-protocols: github:hyprwm/hyprland-protocols/0c2ce70625cb30aef199cb388f99e19a61a6ce03 (2023-08-11 11:36:36)
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprlang: github:hyprwm/hyprlang/78fcaa27ae9e1d782faa3ff06c8ea55ddce63706 (2024-04-14 19:00:46)
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprwayland-scanner: github:hyprwm/hyprwayland-scanner/126dad854f22fe30e6b82cd21808e76903d90ac5 (2024-04-26 22:46:19)
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───nixpkgs: github:NixOS/nixpkgs/6143fc5eeb9c4f00163267708e26191d1e918932 (2024-04-21 15:54:59)
│   ├───systems: github:nix-systems/default-linux/31732fcf5e8fea42e59c2488ad31a0e651500f68 (2023-07-14 15:19:09)
│   ├───wlroots: github:hyprwm/wlroots-hyprland/5c1d51c5a2793480f5b6c4341ad0797052aec2ea (2024-04-21 20:33:21)
│   └───xdph: github:hyprwm/xdg-desktop-portal-hyprland/9ace6f969ce495185df34cc6254fb9d297765478 (2024-04-21 18:33:52)
│       ├───hyprland-protocols follows input 'hyprland/hyprland-protocols'
│       ├───hyprlang follows input 'hyprland/hyprlang'
│       ├───nixpkgs follows input 'hyprland/nixpkgs'
│       └───systems follows input 'hyprland/systems'
├───hyprlock: github:hyprwm/hyprlock/415262065fff0a04b229cd00165f346a86a0a73a (2024-04-24 17:06:14)
│   ├───hyprlang: github:hyprwm/hyprlang/78fcaa27ae9e1d782faa3ff06c8ea55ddce63706 (2024-04-14 19:00:46)
│   │   ├───nixpkgs follows input 'hyprlock/nixpkgs'
│   │   └───systems: github:nix-systems/default-linux/31732fcf5e8fea42e59c2488ad31a0e651500f68 (2023-07-14 15:19:09)
│   ├───nixpkgs follows input 'nixpkgs'
│   └───systems: github:nix-systems/default-linux/31732fcf5e8fea42e59c2488ad31a0e651500f68 (2023-07-14 15:19:09)
├───hyprpicker: github:hyprwm/hyprpicker/e2472f499d67568edb1b727736c587b877e85344 (2024-04-15 15:49:59)
│   └───nixpkgs follows input 'nixpkgs'
└───nixpkgs: github:NixOS/nixpkgs/58a1abdbae3217ca6b702f03d3b35125d88a2994 (2024-04-27 21:35:43)

```

### Flake Outputs

```nix
git+file:///home/runner/work/nixflakes/nixflakes?rev=78ba636c54725dfc4cbe55fa313889b9986a0388&shallow=1
├───devShells
│   └───x86_64-linux
│       └───default: development environment 'nix-shell'
├───formatter
│   └───x86_64-linux: package 'nixfmt-unstable-2024-03-01'
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
