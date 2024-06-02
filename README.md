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
Locked URL:    git+file:///home/runner/work/nixflakes/nixflakes?rev=630dc206579913d9b799daeeda7863923333f167&shallow=1
Description:   Eriim's machine specific configuration flake.
Path:          /nix/store/izyfk87pgmdrhm8asvd2ryvhi6893zns-source
Revision:      630dc206579913d9b799daeeda7863923333f167
Revisions:     1
Last modified: 2024-06-02 16:25:47
Inputs:
├───NixOS-WSL: github:nix-community/NixOS-WSL/020cd466170204e448b24b246045599fce69ad91 (2024-05-25 12:32:24)
│   ├───flake-compat: github:edolstra/flake-compat/0f9255e01c2351cc7d116c072cb317785dd33b33 (2023-10-04 13:37:54)
│   ├───flake-utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   └───nixpkgs follows input 'nixpkgs'
├───agenix: github:ryantm/agenix/c2fc0762bbe8feb06a2e59a364fa81b3a57671c9 (2024-05-24 14:40:46)
│   ├───darwin follows input ''
│   ├───home-manager: github:nix-community/home-manager/3bfaacf46133c037bb356193bd2f1765d9dc82c1 (2023-12-20 23:00:17)
│   │   └───nixpkgs follows input 'agenix/nixpkgs'
│   ├───nixpkgs follows input 'nixpkgs'
│   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
├───eriixpkgs: github:erictossell/eriixpkgs/f8caa1dbedd985c1a79b975779e4ef8bd5cc1a0d (2024-06-02 00:22:10)
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
│   ├───readme-py: github:erictossell/readme-py/5aa386ce95659257d578c9a80d75fefe16ae1b1a (2024-06-02 00:12:29)
│   │   ├───flake-utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│   │   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │   ├───nixpkgs: github:NixOS/nixpkgs/ad57eef4ef0659193044870c731987a6df5cf56b (2024-05-29 02:06:23)
│   │   └───poetry2nix: github:nix-community/poetry2nix/11e97e742da5b4e43c27cfe13fca904e82fd4e56 (2024-06-01 13:55:09)
│   │       ├───flake-utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│   │       │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │       ├───nix-github-actions: github:nix-community/nix-github-actions/5163432afc817cf8bd1f031418d1869e4c9d5547 (2023-12-29 15:30:25)
│   │       │   └───nixpkgs follows input 'eriixpkgs/readme-py/poetry2nix/nixpkgs'
│   │       ├───nixpkgs follows input 'eriixpkgs/readme-py/nixpkgs'
│   │       ├───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │       └───treefmt-nix: github:numtide/treefmt-nix/03b982b77df58d5974c61c6022085bafe780c1cf (2024-05-31 19:02:28)
│   │           └───nixpkgs follows input 'eriixpkgs/readme-py/poetry2nix/nixpkgs'
│   └───russh: github:erictossell/russh/dd53274d43199a67f9d192d88b6f77807363657b (2024-04-30 21:45:16)
│       ├───naersk: github:nix-community/naersk/c5037590290c6c7dae2e42e7da1e247e54ed2d49 (2024-04-19 09:58:44)
│       │   └───nixpkgs: path:/nix/store/370qy3d3wg9zhbn5a3dcv6k1q1iigfh4-source?lastModified=0&narHash=sha256-Drmja/f5MRHZCskS6mvzFqxEaZMeciScCTFxWVLqWEY%3D (1970-01-01 00:00:00)
│       ├───nixpkgs: github:NixOS/nixpkgs/cf8cc1201be8bc71b7cbbbdaf349b22f4f99c7ae (2024-04-28 14:22:29)
│       └───utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│           └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
├───home-manager: github:nix-community/home-manager/9b53a10f4c91892f5af87cf55d08fba59ca086af (2024-06-02 08:16:22)
│   └───nixpkgs follows input 'nixpkgs'
├───hyprland: git+https://github.com/hyprwm/Hyprland?ref=refs/heads/main&rev=0ebb43c1a37e7321e5ed7223ea85ed555cc82735&submodules=1 (2024-06-01 18:45:30)
│   ├───hyprcursor: github:hyprwm/hyprcursor/57298fc4f13c807e50ada2c986a3114b7fc2e621 (2024-05-24 18:46:51)
│   │   ├───hyprlang follows input 'hyprland/hyprlang'
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprlang: github:hyprwm/hyprlang/87d5d984109c839482b88b4795db073eb9ed446f (2024-05-23 14:16:22)
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprwayland-scanner: github:hyprwm/hyprwayland-scanner/3afed4364790aebe0426077631af1e164a9650cc (2024-05-18 18:52:55)
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───nixpkgs: github:NixOS/nixpkgs/5710852ba686cc1fd0d3b8e22b3117d43ba374c2 (2024-05-21 22:21:37)
│   ├───systems: github:nix-systems/default-linux/31732fcf5e8fea42e59c2488ad31a0e651500f68 (2023-07-14 15:19:09)
│   └───xdph: github:hyprwm/xdg-desktop-portal-hyprland/91e48d6acd8a5a611d26f925e51559ab743bc438 (2024-05-21 11:16:37)
│       ├───hyprland-protocols: github:hyprwm/hyprland-protocols/0c2ce70625cb30aef199cb388f99e19a61a6ce03 (2023-08-11 11:36:36)
│       │   ├───nixpkgs follows input 'hyprland/xdph/nixpkgs'
│       │   └───systems follows input 'hyprland/xdph/systems'
│       ├───hyprlang follows input 'hyprland/hyprlang'
│       ├───nixpkgs follows input 'hyprland/nixpkgs'
│       └───systems follows input 'hyprland/systems'
├───hyprlock: github:hyprwm/hyprlock/e07d4110dc0b9d1786403aa760232564ad28b6fa (2024-05-29 12:54:37)
│   ├───hyprlang: github:hyprwm/hyprlang/78fcaa27ae9e1d782faa3ff06c8ea55ddce63706 (2024-04-14 19:00:46)
│   │   ├───nixpkgs follows input 'hyprlock/nixpkgs'
│   │   └───systems: github:nix-systems/default-linux/31732fcf5e8fea42e59c2488ad31a0e651500f68 (2023-07-14 15:19:09)
│   ├───nixpkgs follows input 'nixpkgs'
│   └───systems: github:nix-systems/default-linux/31732fcf5e8fea42e59c2488ad31a0e651500f68 (2023-07-14 15:19:09)
├───hyprpicker: github:hyprwm/hyprpicker/bff005ac9c308acb3046d277b60879defb1ee303 (2024-05-14 15:13:12)
│   └───nixpkgs follows input 'nixpkgs'
└───nixpkgs: github:NixOS/nixpkgs/ad57eef4ef0659193044870c731987a6df5cf56b (2024-05-29 02:06:23)

```

### Flake Outputs

```nix
git+file:///home/runner/work/nixflakes/nixflakes?rev=630dc206579913d9b799daeeda7863923333f167&shallow=1
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
