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
Locked URL:    git+file:///home/runner/work/nixflakes/nixflakes?rev=a8433c38f283d9e29bbb6a974828a64755801d80&shallow=1
Description:   Eriim's machine specific configuration flake.
Path:          /nix/store/psqvdbmrckjc4ixfa9h2lkcyv6dcm6c1-source
Revision:      a8433c38f283d9e29bbb6a974828a64755801d80
Revisions:     1
Last modified: 2024-04-27 13:56:35
Inputs:
├───NixOS-WSL: github:nix-community/NixOS-WSL/4fb773cffed9bf1efdabcc01b25637eaeb4e8e9c (2024-04-26 12:31:44)
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
├───eriixpkgs: github:erictossell/eriixpkgs/b3936e85fe6b1d559d0346a9cb39a8bbdb6bcb49 (2024-04-21 00:19:47)
│   ├───eriixvim: github:erictossell/eriixvim/729321128a872bccbe7320ba25a7b6708590cf4d (2024-03-27 17:09:57)
│   │   ├───flake-parts: github:hercules-ci/flake-parts/f7b3c975cf067e56e7cda6cb098ebe3fb4d74ca2 (2024-03-01 23:36:56)
│   │   │   └───nixpkgs-lib: github:NixOS/nixpkgs/1536926ef5621b09bba54035ae2bb6d806d72ac8?dir=lib (2024-02-29 20:09:43)
│   │   ├───nixpkgs: github:nixos/nixpkgs/20f77aa09916374aa3141cbc605c955626762c9a (2024-03-21 06:18:55)
│   │   └───nixvim: github:nix-community/nixvim/822ec15646b8f7b621468b503118921d644acf39 (2024-03-22 16:25:05)
│   │       ├───devshell: github:numtide/devshell/2d45b54ca4a183f2fdcf4b19c895b64fbf620ee8 (2024-03-22 09:23:46)
│   │       │   ├───flake-utils: github:numtide/flake-utils/4022d587cbbfd70fe950c1e2083a02621806a725 (2023-12-04 08:58:27)
│   │       │   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │       │   └───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       ├───flake-compat: https://api.flakehub.com/f/pinned/edolstra/flake-compat/1.0.1/018afb31-abd1-7bff-a5e4-cff7e18efb7a/source.tar.gz?narHash=sha256-kvjfFW7WAETZlt09AgDn1MrtKzP7t90Vf7vypd3OL1U%3D (2023-10-04 13:37:54)
│   │       ├───flake-parts: github:hercules-ci/flake-parts/f7b3c975cf067e56e7cda6cb098ebe3fb4d74ca2 (2024-03-01 23:36:56)
│   │       │   └───nixpkgs-lib follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       ├───home-manager: github:nix-community/home-manager/1c2acec99933f9835cc7ad47e35303de92d923a4 (2024-03-20 22:41:55)
│   │       │   └───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       ├───nix-darwin: github:lnl7/nix-darwin/bcc8afd06e237df060c85bad6af7128e05fd61a3 (2024-03-17 23:13:25)
│   │       │   └───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       ├───nixpkgs: github:NixOS/nixpkgs/20f77aa09916374aa3141cbc605c955626762c9a (2024-03-21 06:18:55)
│   │       └───pre-commit-hooks: github:cachix/pre-commit-hooks.nix/e611897ddfdde3ed3eaac4758635d7177ff78673 (2024-03-20 08:24:28)
│   │           ├───flake-compat: github:edolstra/flake-compat/0f9255e01c2351cc7d116c072cb317785dd33b33 (2023-10-04 13:37:54)
│   │           ├───flake-utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│   │           │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │           ├───gitignore: github:hercules-ci/gitignore.nix/637db329424fd7e46cf4185293b9cc8c88c95394 (2024-02-28 02:28:52)
│   │           │   └───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/pre-commit-hooks/nixpkgs'
│   │           ├───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │           └───nixpkgs-stable follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   ├───flake-utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   ├───go-time: github:erictossell/go-time/8c3f36400edb3fb5957c73610f1a311c21f6d98b (2024-03-24 22:08:24)
│   │   └───nixpkgs: github:NixOS/nixpkgs/c3e128f3c0ecc1fb04aef9f72b3dcc2f6cecf370 (2024-01-15 10:54:13)
│   ├───homepage-nix: github:erictossell/homepage-nix/c6620260812bc35ee7209ab2fa0f4899868b86f1 (2024-03-08 02:17:42)
│   │   ├───naersk: github:nix-community/naersk/aeb58d5e8faead8980a807c840232697982d47b9 (2023-10-27 15:31:12)
│   │   │   └───nixpkgs: github:NixOS/nixpkgs/f945939fd679284d736112d3d5410eb867f3b31c (2024-03-07 02:56:54)
│   │   ├───nixpkgs: github:NixOS/nixpkgs/f945939fd679284d736112d3d5410eb867f3b31c (2024-03-07 02:56:54)
│   │   └───utils: github:numtide/flake-utils/d465f4819400de7c8d874d50b982301f28a84605 (2024-02-28 13:18:44)
│   │       └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   ├───nixpkgs follows input 'nixpkgs'
│   ├───readme-py: github:erictossell/readme-py/1b066e83f280c9f22b3203390326e4065867476b (2024-04-21 00:11:51)
│   │   ├───flake-utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│   │   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │   ├───nixpkgs: github:NixOS/nixpkgs/5c24cf2f0a12ad855f444c30b2421d044120c66f (2024-04-19 14:35:08)
│   │   └───poetry2nix: github:nix-community/poetry2nix/3c92540611f42d3fb2d0d084a6c694cd6544b609 (2024-02-22 08:17:04)
│   │       ├───flake-utils: github:numtide/flake-utils/1ef2e671c3b0c19053962c07dbda38332dcebf26 (2024-01-15 09:00:34)
│   │       │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │       ├───nix-github-actions: github:nix-community/nix-github-actions/5163432afc817cf8bd1f031418d1869e4c9d5547 (2023-12-29 15:30:25)
│   │       │   └───nixpkgs follows input 'eriixpkgs/readme-py/poetry2nix/nixpkgs'
│   │       ├───nixpkgs follows input 'eriixpkgs/readme-py/nixpkgs'
│   │       ├───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │       └───treefmt-nix: github:numtide/treefmt-nix/e504621290a1fd896631ddbc5e9c16f4366c9f65 (2024-02-19 09:30:38)
│   │           └───nixpkgs follows input 'eriixpkgs/readme-py/poetry2nix/nixpkgs'
│   └───russh: github:erictossell/russh/948dfb643c24c0f029d9917c0fd665b97ade3926 (2024-01-25 00:20:09)
│       ├───naersk: github:nix-community/naersk/aeb58d5e8faead8980a807c840232697982d47b9 (2023-10-27 15:31:12)
│       │   └───nixpkgs: github:NixOS/nixpkgs/e5d1c87f5813afde2dda384ac807c57a105721cc (2024-01-19 20:59:21)
│       ├───nixpkgs: github:NixOS/nixpkgs/e5d1c87f5813afde2dda384ac807c57a105721cc (2024-01-19 20:59:21)
│       └───utils: github:numtide/flake-utils/1ef2e671c3b0c19053962c07dbda38332dcebf26 (2024-01-15 09:00:34)
│           └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
├───home-manager: github:nix-community/home-manager/c1609d584a6b5e9e6a02010f51bd368cb4782f8e (2024-04-27 07:40:03)
│   └───nixpkgs follows input 'nixpkgs'
├───hyprland: github:hyprwm/hyprland/bca7804bb6e1bf5ce5a99b9ae4806be25e36993c (2024-04-27 11:43:12)
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
└───nixpkgs: github:NixOS/nixpkgs/7bb2ccd8cdc44c91edba16c48d2c8f331fb3d856 (2024-04-25 20:15:41)

```

### Flake Outputs

```nix
git+file:///home/runner/work/nixflakes/nixflakes?rev=a8433c38f283d9e29bbb6a974828a64755801d80&shallow=1
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
