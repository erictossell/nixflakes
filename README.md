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
Locked URL:    git+file:///home/runner/work/nixflakes/nixflakes?rev=d436d9ef8af75c42d0432ac77b44336b9f3955bb&shallow=1
Description:   Eriim's machine specific configuration flake.
Path:          /nix/store/q5wwvvc0jxj4w8bgizphwlx9gb590h8x-source
Revision:      d436d9ef8af75c42d0432ac77b44336b9f3955bb
Revisions:     1
Last modified: 2024-08-03 07:30:32
Inputs:
├───NixOS-WSL: github:nix-community/NixOS-WSL/f373ad59ae5866f0f98216bd5c71526b373450d2 (2024-07-29 11:38:12)
│   ├───flake-compat: github:edolstra/flake-compat/0f9255e01c2351cc7d116c072cb317785dd33b33 (2023-10-04 13:37:54)
│   ├───flake-utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   └───nixpkgs follows input 'nixpkgs'
├───agenix: github:ryantm/agenix/3f1dae074a12feb7327b4bf43cbac0d124488bb7 (2024-07-30 11:30:03)
│   ├───darwin follows input ''
│   ├───home-manager: github:nix-community/home-manager/3bfaacf46133c037bb356193bd2f1765d9dc82c1 (2023-12-20 23:00:17)
│   │   └───nixpkgs follows input 'agenix/nixpkgs'
│   ├───nixpkgs follows input 'nixpkgs'
│   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
├───eriixpkgs: github:erictossell/eriixpkgs/6f95c2f89d5d8f6c435d9986058c3af4a14578ae (2024-08-03 05:33:00)
│   ├───eriixvim: github:erictossell/eriixvim/e61f2d923bc36461bfd567408b9b58959ebc2592 (2024-08-03 05:13:38)
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
│   ├───go-time: github:erictossell/go-time/f6fde276a99e8f19ed1e3d5b0f4946383eb4bc35 (2024-07-14 13:24:29)
│   │   └───nixpkgs: github:NixOS/nixpkgs/7e7c39ea35c5cdd002cd4588b03a3fb9ece6fad9 (2024-07-12 07:14:11)
│   ├───homepage-nix: github:erictossell/homepage-nix/540adeb9f307826c9bdd1b047a8b4467160709a4 (2024-07-05 04:49:49)
│   │   ├───naersk: github:nix-community/naersk/941ce6dc38762a7cfb90b5add223d584feed299b (2024-06-18 16:21:15)
│   │   │   └───nixpkgs: path:/nix/store/dk2rpyb6ndvfbf19bkb2plcz5y3k8i5v-source?lastModified=0&narHash=sha256-rwz8NJZV%2B387rnWpTYcXaRNvzUSnnF9aHONoJIYmiUQ%3D (1970-01-01 00:00:00)
│   │   ├───nixpkgs: github:NixOS/nixpkgs/1afc5440469f94e7ed26e8648820971b102afdc3 (2024-07-04 10:07:58)
│   │   └───utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│   │       └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   ├───nixpkgs follows input 'nixpkgs'
│   ├───readme-py: github:erictossell/readme-py/6b0cdeb81868a3923d19ecb5087da4c5011aeff1 (2024-07-28 00:13:54)
│   │   ├───flake-utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│   │   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │   ├───nixpkgs: github:NixOS/nixpkgs/b73c2221a46c13557b1b3be9c2070cc42cf01eb3 (2024-07-27 06:49:29)
│   │   └───poetry2nix: github:nix-community/poetry2nix/d11c01e58587e5f21037ed6477465a7f26a32e27 (2024-07-15 10:37:54)
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
├───home-manager: github:nix-community/home-manager/afc892db74d65042031a093adb6010c4c3378422 (2024-08-02 20:21:05)
│   └───nixpkgs follows input 'nixpkgs'
├───hyprland: git+https://github.com/hyprwm/Hyprland?ref=refs/heads/main&rev=4141e6755022edc19cd37cd7ad077a93b3bae5bd&submodules=1 (2024-08-02 21:16:20)
│   ├───aquamarine: github:hyprwm/aquamarine/7c3565f9bedc7cb601cc0baa14792247e4dc1d5a (2024-07-30 13:55:39)
│   │   ├───hyprutils follows input 'hyprland/hyprutils'
│   │   ├───hyprwayland-scanner follows input 'hyprland/hyprwayland-scanner'
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprcursor: github:hyprwm/hyprcursor/4493a972b48f9c3014befbbf381ed5fff91a65dc (2024-07-18 19:19:31)
│   │   ├───hyprlang follows input 'hyprland/hyprlang'
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprlang: github:hyprwm/hyprlang/adbefbf49664a6c2c8bf36b6487fd31e3eb68086 (2024-07-18 17:39:21)
│   │   ├───hyprutils follows input 'hyprland/hyprutils'
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprutils: github:hyprwm/hyprutils/5dcbbc1e3de40b2cecfd2007434d86e924468f1f (2024-07-27 16:47:29)
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprwayland-scanner: github:hyprwm/hyprwayland-scanner/a048a6cb015340bd82f97c1f40a4b595ca85cc30 (2024-07-18 17:35:19)
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───nixpkgs: github:NixOS/nixpkgs/52ec9ac3b12395ad677e8b62106f0b98c1f8569d (2024-07-28 16:52:11)
│   ├───systems: github:nix-systems/default-linux/31732fcf5e8fea42e59c2488ad31a0e651500f68 (2023-07-14 15:19:09)
│   └───xdph: github:hyprwm/xdg-desktop-portal-hyprland/7f2a77ddf60390248e2a3de2261d7102a13e5341 (2024-07-30 18:59:36)
│       ├───hyprland-protocols: github:hyprwm/hyprland-protocols/5a11232266bf1a1f5952d5b179c3f4b2facaaa84 (2024-07-18 18:15:55)
│       │   ├───nixpkgs follows input 'hyprland/xdph/nixpkgs'
│       │   └───systems follows input 'hyprland/xdph/systems'
│       ├───hyprlang follows input 'hyprland/hyprlang'
│       ├───nixpkgs follows input 'hyprland/nixpkgs'
│       └───systems follows input 'hyprland/systems'
├───hyprlock: github:hyprwm/hyprlock/c7fa5026c074dc1670a6665cdfece41d920d35b1 (2024-08-02 18:39:54)
│   ├───hyprlang: github:hyprwm/hyprlang/adbefbf49664a6c2c8bf36b6487fd31e3eb68086 (2024-07-18 17:39:21)
│   │   ├───hyprutils follows input 'hyprlock/hyprutils'
│   │   ├───nixpkgs follows input 'hyprlock/nixpkgs'
│   │   └───systems follows input 'hyprlock/systems'
│   ├───hyprutils: github:hyprwm/hyprutils/962582a090bc233c4de9d9897f46794280288989 (2024-07-18 17:35:02)
│   │   ├───nixpkgs follows input 'hyprlock/nixpkgs'
│   │   └───systems follows input 'hyprlock/systems'
│   ├───nixpkgs follows input 'nixpkgs'
│   └───systems: github:nix-systems/default-linux/31732fcf5e8fea42e59c2488ad31a0e651500f68 (2023-07-14 15:19:09)
├───hyprpicker: github:hyprwm/hyprpicker/c36676ad0c08312ee07f061e210991f0176d6747 (2024-07-18 18:01:51)
│   ├───hyprutils: github:hyprwm/hyprutils/962582a090bc233c4de9d9897f46794280288989 (2024-07-18 17:35:02)
│   │   ├───nixpkgs follows input 'hyprpicker/nixpkgs'
│   │   └───systems follows input 'hyprpicker/systems'
│   ├───nixpkgs follows input 'nixpkgs'
│   └───systems: github:nix-systems/default-linux/31732fcf5e8fea42e59c2488ad31a0e651500f68 (2023-07-14 15:19:09)
├───nixpkgs: github:NixOS/nixpkgs/9f918d616c5321ad374ae6cb5ea89c9e04bf3e58 (2024-07-31 10:19:44)
└───stylix: github:danth/stylix/feb2973dfa8232c07efbd2b48f11a5cfa2276570 (2024-07-29 23:21:31)
    ├───base16: github:SenchoPens/base16.nix/665b3c6748534eb766c777298721cece9453fdae (2024-02-25 19:47:46)
    │   └───fromYaml: github:SenchoPens/fromYaml/11fbbbfb32e3289d3c631e0134a23854e7865c84 (2023-07-16 23:25:21)
    ├───base16-fish: github:tomyun/base16-fish/2f6dd973a9075dabccd26f1cded09508180bf5fe (2021-06-01 15:05:57)
    ├───base16-foot: github:tinted-theming/base16-foot/eedbcfa30de0a4baa03e99f5e3ceb5535c2755ce (2023-10-08 00:45:48)
    ├───base16-helix: github:tinted-theming/base16-helix/34f41987bec14c0f3f6b2155c19787b1f6489625 (2024-07-12 18:43:34)
    ├───base16-kitty: github:kdrag0n/base16-kitty/06bb401fa9a0ffb84365905ffbb959ae5bf40805 (2022-10-05 20:22:08)
    ├───base16-tmux: github:tinted-theming/base16-tmux/c02050bebb60dbb20cb433cd4d8ce668ecc11ba7 (2023-10-08 00:45:02)
    ├───base16-vim: github:tinted-theming/base16-vim/6e955d704d046b0dc3e5c2d68a2a6eeffd2b5d3d (2024-05-19 20:21:23)
    ├───flake-compat: github:edolstra/flake-compat/35bb57c0c8d8b62bbfd284272c928ceb64ddbde9 (2023-01-17 11:47:33)
    ├───gnome-shell: github:GNOME/gnome-shell/0d0aadf013f78a7f7f1dc984d0d812971864b934 (2024-04-21 12:24:51)
    ├───home-manager: github:nix-community/home-manager/e3ad5108f54177e6520535768ddbf1e6af54b59d (2024-05-17 07:24:04)
    │   └───nixpkgs follows input 'stylix/nixpkgs'
    └───nixpkgs follows input 'nixpkgs'

```

### Flake Outputs

```nix
git+file:///home/runner/work/nixflakes/nixflakes?rev=d436d9ef8af75c42d0432ac77b44336b9f3955bb&shallow=1
├───devShells
│   └───x86_64-linux
│       └───default: development environment 'nix-shell'
├───formatter
│   └───x86_64-linux: package 'nixfmt-unstable-2024-07-12'
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
