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
Locked URL:    git+file:///home/runner/work/nixflakes/nixflakes?shallow=1
Description:   Eriim's machine specific configuration flake.
Path:          /nix/store/mlparrh1x1n2hn1s02rcw8yjw323b10l-source
Revision:      f5526b637d4d3b611d90b84e80183cb6be003c63-dirty
Last modified: 2024-10-26 13:12:42
Inputs:
├───NixOS-WSL: github:nix-community/NixOS-WSL/5a965cb108fb1f30b29a26dbc29b473f49e80b41 (2024-10-23 21:07:58)
│   ├───flake-compat: github:edolstra/flake-compat/0f9255e01c2351cc7d116c072cb317785dd33b33 (2023-10-04 13:37:54)
│   ├───flake-utils: github:numtide/flake-utils/c1dfcf08411b08f6b8615f7d8971a2bfa81d5e8a (2024-09-17 08:14:13)
│   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   └───nixpkgs follows input 'nixpkgs'
├───agenix: github:ryantm/agenix/f6291c5935fdc4e0bef208cfc0dcab7e3f7a1c41 (2024-08-10 12:45:04)
│   ├───darwin follows input ''
│   ├───home-manager: github:nix-community/home-manager/3bfaacf46133c037bb356193bd2f1765d9dc82c1 (2023-12-20 23:00:17)
│   │   └───nixpkgs follows input 'agenix/nixpkgs'
│   ├───nixpkgs follows input 'nixpkgs'
│   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
├───eriixpkgs: github:erictossell/eriixpkgs/aa872ba08f7149360d2767a2e8505042e774fc3c (2024-10-20 00:26:44)
│   ├───eriixvim: github:erictossell/eriixvim/9cedbe64f84364d2dda4cb0c5f250d2aa701d3a8 (2024-08-11 03:17:14)
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
│   ├───flake-utils: github:numtide/flake-utils/c1dfcf08411b08f6b8615f7d8971a2bfa81d5e8a (2024-09-17 08:14:13)
│   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   ├───go-time: github:erictossell/go-time/f6fde276a99e8f19ed1e3d5b0f4946383eb4bc35 (2024-07-14 13:24:29)
│   │   └───nixpkgs: github:NixOS/nixpkgs/7e7c39ea35c5cdd002cd4588b03a3fb9ece6fad9 (2024-07-12 07:14:11)
│   ├───homepage-nix: github:erictossell/homepage-nix/540adeb9f307826c9bdd1b047a8b4467160709a4 (2024-07-05 04:49:49)
│   │   ├───naersk: github:nix-community/naersk/941ce6dc38762a7cfb90b5add223d584feed299b (2024-06-18 16:21:15)
│   │   │   └───nixpkgs: path:/nix/store/dk2rpyb6ndvfbf19bkb2plcz5y3k8i5v-source?lastModified=0&narHash=sha256-rwz8NJZV%2B387rnWpTYcXaRNvzUSnnF9aHONoJIYmiUQ%3D (1970-01-01 00:00:00)
│   │   ├───nixpkgs: github:NixOS/nixpkgs/1afc5440469f94e7ed26e8648820971b102afdc3 (2024-07-04 10:07:58)
│   │   └───utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│   │       └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   ├───nixpkgs follows input 'nixpkgs'
│   ├───readme-py: github:erictossell/readme-py/e1b327a06ff6a3b5ac2a8ed5a71f174dad5cbda7 (2024-10-20 00:14:49)
│   │   ├───flake-utils: github:numtide/flake-utils/c1dfcf08411b08f6b8615f7d8971a2bfa81d5e8a (2024-09-17 08:14:13)
│   │   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │   ├───nixpkgs: github:NixOS/nixpkgs/4c2fcb090b1f3e5b47eaa7bd33913b574a11e0a0 (2024-10-18 13:02:40)
│   │   └───poetry2nix: github:nix-community/poetry2nix/e67cc181b5bdf5aa46f1340fa9acd3910f6fb122 (2024-10-17 14:02:51)
│   │       ├───flake-utils: github:numtide/flake-utils/c1dfcf08411b08f6b8615f7d8971a2bfa81d5e8a (2024-09-17 08:14:13)
│   │       │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │       ├───nix-github-actions: github:nix-community/nix-github-actions/622f829f5fe69310a866c8a6cd07e747c44ef820 (2024-07-04 04:12:51)
│   │       │   └───nixpkgs follows input 'eriixpkgs/readme-py/poetry2nix/nixpkgs'
│   │       ├───nixpkgs follows input 'eriixpkgs/readme-py/nixpkgs'
│   │       ├───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │       └───treefmt-nix: github:numtide/treefmt-nix/4446c7a6fc0775df028c5a3f6727945ba8400e64 (2024-10-03 19:47:24)
│   │           └───nixpkgs follows input 'eriixpkgs/readme-py/poetry2nix/nixpkgs'
│   └───russh: github:erictossell/russh/45da95e1260fe25cd7145a23e4111d84b5b8ef7f (2024-07-05 04:45:21)
│       ├───naersk: github:nix-community/naersk/941ce6dc38762a7cfb90b5add223d584feed299b (2024-06-18 16:21:15)
│       │   └───nixpkgs: path:/nix/store/dk2rpyb6ndvfbf19bkb2plcz5y3k8i5v-source?lastModified=0&narHash=sha256-rwz8NJZV%2B387rnWpTYcXaRNvzUSnnF9aHONoJIYmiUQ%3D (1970-01-01 00:00:00)
│       ├───nixpkgs: github:NixOS/nixpkgs/1afc5440469f94e7ed26e8648820971b102afdc3 (2024-07-04 10:07:58)
│       └───utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│           └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
├───home-manager: github:nix-community/home-manager/93435d27d250fa986bfec6b2ff263161ff8288cb (2024-10-25 22:16:39)
│   └───nixpkgs follows input 'nixpkgs'
├───hyprland: git+https://github.com/hyprwm/Hyprland?ref=refs/heads/main&rev=0b29caf9ab86518ff474eed5e7d19c12f96ebbd0&submodules=1 (2024-10-26 01:22:37)
│   ├───aquamarine: github:hyprwm/aquamarine/8d732fa8aff8b12ef2b1e2f00fc8153e41312b72 (2024-10-21 16:13:19)
│   │   ├───hyprutils follows input 'hyprland/hyprutils'
│   │   ├───hyprwayland-scanner follows input 'hyprland/hyprwayland-scanner'
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprcursor: github:hyprwm/hyprcursor/0264e698149fcb857a66a53018157b41f8d97bb0 (2024-10-11 18:02:18)
│   │   ├───hyprlang follows input 'hyprland/hyprlang'
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprland-protocols: github:hyprwm/hyprland-protocols/a7c183800e74f337753de186522b9017a07a8cee (2024-10-07 23:50:20)
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprlang: github:hyprwm/hyprlang/f054f2e44d6a0b74607a6bc0f52dba337a3db38e (2024-10-05 22:50:12)
│   │   ├───hyprutils follows input 'hyprland/hyprutils'
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprutils: github:hyprwm/hyprutils/fd4be8b9ca932f7384e454bcd923c5451ef2aa85 (2024-10-14 21:27:36)
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprwayland-scanner: github:hyprwm/hyprwayland-scanner/500c81a9e1a76760371049a8d99e008ea77aa59e (2024-09-20 23:27:16)
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───nixpkgs: github:NixOS/nixpkgs/1997e4aa514312c1af7e2bda7fad1644e778ff26 (2024-10-20 08:35:21)
│   ├───pre-commit-hooks: github:cachix/git-hooks.nix/3c3e88f0f544d6bb54329832616af7eb971b6be6 (2024-10-16 18:45:14)
│   │   ├───flake-compat: github:edolstra/flake-compat/0f9255e01c2351cc7d116c072cb317785dd33b33 (2023-10-04 13:37:54)
│   │   ├───gitignore: github:hercules-ci/gitignore.nix/637db329424fd7e46cf4185293b9cc8c88c95394 (2024-02-28 02:28:52)
│   │   │   └───nixpkgs follows input 'hyprland/pre-commit-hooks/nixpkgs'
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───nixpkgs-stable: github:NixOS/nixpkgs/194846768975b7ad2c4988bdb82572c00222c0d7 (2024-07-07 21:02:49)
│   ├───systems: github:nix-systems/default-linux/31732fcf5e8fea42e59c2488ad31a0e651500f68 (2023-07-14 15:19:09)
│   └───xdph: github:hyprwm/xdg-desktop-portal-hyprland/fb9c8d665af0588bb087f97d0f673ddf0d501787 (2024-10-05 22:23:07)
│       ├───hyprland-protocols follows input 'hyprland/hyprland-protocols'
│       ├───hyprlang follows input 'hyprland/hyprlang'
│       ├───hyprutils follows input 'hyprland/hyprutils'
│       ├───hyprwayland-scanner follows input 'hyprland/hyprwayland-scanner'
│       ├───nixpkgs follows input 'hyprland/nixpkgs'
│       └───systems follows input 'hyprland/systems'
├───hyprlock: github:hyprwm/hyprlock/ae3bb0fd43d6129520ec4b1f022976e7b929dcde (2024-10-25 21:04:56)
│   ├───hyprlang: github:hyprwm/hyprlang/f054f2e44d6a0b74607a6bc0f52dba337a3db38e (2024-10-05 22:50:12)
│   │   ├───hyprutils follows input 'hyprlock/hyprutils'
│   │   ├───nixpkgs follows input 'hyprlock/nixpkgs'
│   │   └───systems follows input 'hyprlock/systems'
│   ├───hyprutils: github:hyprwm/hyprutils/3f5293432b6dc6a99f26aca2eba3876d2660665c (2024-09-25 21:44:05)
│   │   ├───nixpkgs follows input 'hyprlock/nixpkgs'
│   │   └───systems follows input 'hyprlock/systems'
│   ├───nixpkgs follows input 'nixpkgs'
│   └───systems: github:nix-systems/default-linux/31732fcf5e8fea42e59c2488ad31a0e651500f68 (2023-07-14 15:19:09)
├───hyprpicker: github:hyprwm/hyprpicker/89b9352d26cc0fd13cd6dc0a77ac18c795a44e59 (2024-10-24 22:51:22)
│   ├───hyprutils: github:hyprwm/hyprutils/3f5293432b6dc6a99f26aca2eba3876d2660665c (2024-09-25 21:44:05)
│   │   ├───nixpkgs follows input 'hyprpicker/nixpkgs'
│   │   └───systems follows input 'hyprpicker/systems'
│   ├───hyprwayland-scanner: github:hyprwm/hyprwayland-scanner/500c81a9e1a76760371049a8d99e008ea77aa59e (2024-09-20 23:27:16)
│   │   ├───nixpkgs follows input 'hyprpicker/nixpkgs'
│   │   └───systems follows input 'hyprpicker/systems'
│   ├───nixpkgs follows input 'nixpkgs'
│   └───systems: github:nix-systems/default-linux/31732fcf5e8fea42e59c2488ad31a0e651500f68 (2023-07-14 15:19:09)
├───nixpkgs: github:NixOS/nixpkgs/2768c7d042a37de65bb1b5b3268fc987e534c49d (2024-10-23 06:41:50)
└───stylix: github:danth/stylix/fb9399b7e2c855f42dae76a363bab28d4f24aa8d (2024-10-19 23:33:13)
    ├───base16: github:SenchoPens/base16.nix/665b3c6748534eb766c777298721cece9453fdae (2024-02-25 19:47:46)
    │   └───fromYaml: github:SenchoPens/fromYaml/11fbbbfb32e3289d3c631e0134a23854e7865c84 (2023-07-16 23:25:21)
    ├───base16-fish: github:tomyun/base16-fish/2f6dd973a9075dabccd26f1cded09508180bf5fe (2021-06-01 15:05:57)
    ├───base16-helix: github:tinted-theming/base16-helix/7f795bf75d38e0eea9fed287264067ca187b88a9 (2024-09-09 05:46:35)
    ├───base16-vim: github:tinted-theming/base16-vim/6e955d704d046b0dc3e5c2d68a2a6eeffd2b5d3d (2024-05-19 20:21:23)
    ├───flake-compat: github:edolstra/flake-compat/35bb57c0c8d8b62bbfd284272c928ceb64ddbde9 (2023-01-17 11:47:33)
    ├───flake-utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
    │   └───systems follows input 'stylix/systems'
    ├───gnome-shell: github:GNOME/gnome-shell/0d0aadf013f78a7f7f1dc984d0d812971864b934 (2024-04-21 12:24:51)
    ├───home-manager: github:nix-community/home-manager/c2cd2a52e02f1dfa1c88f95abeb89298d46023be (2024-08-23 17:56:03)
    │   └───nixpkgs follows input 'stylix/nixpkgs'
    ├───nixpkgs follows input 'nixpkgs'
    ├───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
    ├───tinted-foot: github:tinted-theming/tinted-foot/eedbcfa30de0a4baa03e99f5e3ceb5535c2755ce (2023-10-08 00:45:48)
    ├───tinted-kitty: github:tinted-theming/tinted-kitty/eb39e141db14baef052893285df9f266df041ff8 (2024-05-23 00:13:09)
    └───tinted-tmux: github:tinted-theming/tinted-tmux/c02050bebb60dbb20cb433cd4d8ce668ecc11ba7 (2023-10-08 00:45:02)

```

### Flake Outputs

```nix
git+file:///home/runner/work/nixflakes/nixflakes?shallow=1
├───devShells
│   └───x86_64-linux
│       └───default: development environment 'nix-shell'
├───formatter
│   └───x86_64-linux: package 'nixfmt-unstable-2024-08-16'
├───nixosConfigurations
│   ├───arkhitekton: NixOS configuration
│   ├───live-image: NixOS configuration
│   ├───terminus: NixOS configuration
│   ├───virtualis: NixOS configuration
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
