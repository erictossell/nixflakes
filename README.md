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
Path:          /nix/store/4mmzwhrs9i6rcdj2z2z0f5dmpryfvzw1-source
Revision:      8ab65d3a81897be4b665d5f0c7bf74aba8b75b78-dirty
Last modified: 2024-12-29 15:43:29
Inputs:
├───NixOS-WSL: github:nix-community/NixOS-WSL/dee4425dcee3149475ead0cb6a616b8a028c5888 (2024-12-10 18:12:51)
│   ├───flake-compat: github:edolstra/flake-compat/ff81ac966bb2cae68946d5ed5fc4994f96d0ffec (2024-12-04 16:08:25)
│   ├───flake-utils: github:numtide/flake-utils/11707dc2f618dd54ca8739b309ec4fc024de578b (2024-11-13 21:27:16)
│   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   └───nixpkgs follows input 'nixpkgs'
├───agenix: github:ryantm/agenix/f6291c5935fdc4e0bef208cfc0dcab7e3f7a1c41 (2024-08-10 12:45:04)
│   ├───darwin follows input ''
│   ├───home-manager: github:nix-community/home-manager/3bfaacf46133c037bb356193bd2f1765d9dc82c1 (2023-12-20 23:00:17)
│   │   └───nixpkgs follows input 'agenix/nixpkgs'
│   ├───nixpkgs follows input 'nixpkgs'
│   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
├───eriixpkgs: github:erictossell/eriixpkgs/9dc7451477d1539e57607865841f39ead4a1ba2c (2024-12-29 00:27:26)
│   ├───eriixvim: github:erictossell/eriixvim/0178d25b5979c6c147222274bf21d360515692de (2024-12-04 17:01:23)
│   │   ├───flake-parts: github:hercules-ci/flake-parts/205b12d8b7cd4802fbcb8e8ef6a0f1408781a4f9 (2024-12-04 11:43:21)
│   │   │   └───nixpkgs-lib: https://github.com/NixOS/nixpkgs/archive/5487e69da40cbd611ab2cadee0b4637225f7cfae.tar.gz?narHash=sha256-1qRH7uAUsyQI7R1Uwl4T%2BXvdNv778H0Nb5njNrqvylY%3D (2024-12-01 23:35:40)
│   │   ├───nixpkgs: github:nixos/nixpkgs/55d15ad12a74eb7d4646254e13638ad0c4128776 (2024-12-03 07:54:31)
│   │   └───nixvim: github:nix-community/nixvim/78bfbf7b7eb7a1b6cf42e199547de55a55ba2cea (2024-12-03 10:06:18)
│   │       ├───devshell: github:numtide/devshell/dd6b80932022cea34a019e2bb32f6fa9e494dfef (2024-10-07 19:51:55)
│   │       │   └───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       ├───flake-compat: https://api.flakehub.com/f/pinned/edolstra/flake-compat/1.0.1/018afb31-abd1-7bff-a5e4-cff7e18efb7a/source.tar.gz?narHash=sha256-kvjfFW7WAETZlt09AgDn1MrtKzP7t90Vf7vypd3OL1U%3D (2023-10-04 13:37:54)
│   │       ├───flake-parts: github:hercules-ci/flake-parts/506278e768c2a08bec68eb62932193e341f55c90 (2024-11-01 23:44:49)
│   │       │   └───nixpkgs-lib follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       ├───git-hooks: github:cachix/git-hooks.nix/3308484d1a443fc5bc92012435d79e80458fe43c (2024-11-19 13:12:46)
│   │       │   ├───flake-compat follows input 'eriixpkgs/eriixvim/nixvim/flake-compat'
│   │       │   ├───gitignore: github:hercules-ci/gitignore.nix/637db329424fd7e46cf4185293b9cc8c88c95394 (2024-02-28 02:28:52)
│   │       │   │   └───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/git-hooks/nixpkgs'
│   │       │   ├───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       │   └───nixpkgs-stable follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       ├───home-manager: github:nix-community/home-manager/bf23fe41082aa0289c209169302afd3397092f22 (2024-12-02 21:43:34)
│   │       │   └───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       ├───nix-darwin: github:lnl7/nix-darwin/c6b65d946097baf3915dd51373251de98199280d (2024-12-02 02:04:49)
│   │       │   └───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       ├───nixpkgs: github:NixOS/nixpkgs/ac35b104800bff9028425fec3b6e8a41de2bbfff (2024-12-01 01:19:13)
│   │       ├───nuschtosSearch: github:NuschtOS/search/16307548b7a1247291c84ae6a12c0aacb07dfba2 (2024-11-30 22:40:02)
│   │       │   ├───flake-utils: github:numtide/flake-utils/11707dc2f618dd54ca8739b309ec4fc024de578b (2024-11-13 21:27:16)
│   │       │   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │       │   ├───ixx: github:NuschtOS/ixx/9fd01aad037f345350eab2cd45e1946cc66da4eb (2024-10-26 15:53:28)
│   │       │   │   ├───flake-utils follows input 'eriixpkgs/eriixvim/nixvim/nuschtosSearch/flake-utils'
│   │       │   │   └───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/nuschtosSearch/nixpkgs'
│   │       │   └───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   │       └───treefmt-nix: github:numtide/treefmt-nix/6209c381904cab55796c5d7350e89681d3b2a8ef (2024-11-29 15:27:07)
│   │           └───nixpkgs follows input 'eriixpkgs/eriixvim/nixvim/nixpkgs'
│   ├───flake-utils: github:numtide/flake-utils/11707dc2f618dd54ca8739b309ec4fc024de578b (2024-11-13 21:27:16)
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
│   ├───readme-py: github:erictossell/readme-py/0951e596dde8b6e63b448913218f5f43f037693b (2024-12-29 00:15:18)
│   │   ├───flake-utils: github:numtide/flake-utils/11707dc2f618dd54ca8739b309ec4fc024de578b (2024-11-13 21:27:16)
│   │   │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │   ├───nixpkgs: github:NixOS/nixpkgs/634fd46801442d760e09493a794c4f15db2d0cbb (2024-12-27 09:21:16)
│   │   └───poetry2nix: github:nix-community/poetry2nix/1fb01e90771f762655be7e0e805516cd7fa4d58e (2024-12-25 22:11:04)
│   │       ├───flake-utils: github:numtide/flake-utils/c1dfcf08411b08f6b8615f7d8971a2bfa81d5e8a (2024-09-17 08:14:13)
│   │       │   └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │       ├───nix-github-actions: github:nix-community/nix-github-actions/e04df33f62cdcf93d73e9a04142464753a16db67 (2024-10-24 04:09:24)
│   │       │   └───nixpkgs follows input 'eriixpkgs/readme-py/poetry2nix/nixpkgs'
│   │       ├───nixpkgs follows input 'eriixpkgs/readme-py/nixpkgs'
│   │       ├───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
│   │       └───treefmt-nix: github:numtide/treefmt-nix/9ef337e492a5555d8e17a51c911ff1f02635be15 (2024-10-28 13:05:26)
│   │           └───nixpkgs follows input 'eriixpkgs/readme-py/poetry2nix/nixpkgs'
│   └───russh: github:erictossell/russh/45da95e1260fe25cd7145a23e4111d84b5b8ef7f (2024-07-05 04:45:21)
│       ├───naersk: github:nix-community/naersk/941ce6dc38762a7cfb90b5add223d584feed299b (2024-06-18 16:21:15)
│       │   └───nixpkgs: path:/nix/store/dk2rpyb6ndvfbf19bkb2plcz5y3k8i5v-source?lastModified=0&narHash=sha256-rwz8NJZV%2B387rnWpTYcXaRNvzUSnnF9aHONoJIYmiUQ%3D (1970-01-01 00:00:00)
│       ├───nixpkgs: github:NixOS/nixpkgs/1afc5440469f94e7ed26e8648820971b102afdc3 (2024-07-04 10:07:58)
│       └───utils: github:numtide/flake-utils/b1d9ab70662946ef0850d488da1c9019f3a9752a (2024-03-11 08:33:50)
│           └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
├───home-manager: github:nix-community/home-manager/10e99c43cdf4a0713b4e81d90691d22c6a58bdf2 (2024-12-28 10:16:56)
│   └───nixpkgs follows input 'nixpkgs'
├───hyprland: git+https://github.com/hyprwm/Hyprland?ref=refs/heads/main&rev=2b01a5bcf62956a5d641a3367edcd35e103edfcd&submodules=1 (2024-12-28 14:07:42)
│   ├───aquamarine: github:hyprwm/aquamarine/eecb74dc79bb6752a2a507e6edee3042390a6091 (2024-12-22 22:27:26)
│   │   ├───hyprutils follows input 'hyprland/hyprutils'
│   │   ├───hyprwayland-scanner follows input 'hyprland/hyprwayland-scanner'
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprcursor: github:hyprwm/hyprcursor/69270ba8f057d55b0e6c2dca0e165d652856e613 (2024-12-22 22:29:00)
│   │   ├───hyprlang follows input 'hyprland/hyprlang'
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprgraphics: github:hyprwm/hyprgraphics/6dea3fba08fd704dd624b6d4b261638fb4003c9c (2024-12-22 22:23:56)
│   │   ├───hyprutils follows input 'hyprland/hyprutils'
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprland-protocols: github:hyprwm/hyprland-protocols/a7c183800e74f337753de186522b9017a07a8cee (2024-10-07 23:50:20)
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprland-qtutils: github:hyprwm/hyprland-qtutils/c77109d7e1ddbcdb87cafd32ce411f76328ae152 (2024-12-22 22:27:52)
│   │   ├───hyprutils follows input 'hyprland/hyprutils'
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprlang: github:hyprwm/hyprlang/0404833ea18d543df44df935ebf1b497310eb046 (2024-12-22 22:24:19)
│   │   ├───hyprutils follows input 'hyprland/hyprutils'
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprutils: github:hyprwm/hyprutils/8f15d45b120b33712f6db477fe5ffb18034d0ea8 (2024-12-27 16:23:03)
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprwayland-scanner: github:hyprwm/hyprwayland-scanner/4d7367b6eee87397e2dbca2e78078dd0a4ef4c61 (2024-12-21 15:05:13)
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───nixpkgs: github:NixOS/nixpkgs/634fd46801442d760e09493a794c4f15db2d0cbb (2024-12-27 09:21:16)
│   ├───pre-commit-hooks: github:cachix/git-hooks.nix/f0f0dc4920a903c3e08f5bdb9246bb572fcae498 (2024-12-21 16:13:23)
│   │   ├───flake-compat: github:edolstra/flake-compat/0f9255e01c2351cc7d116c072cb317785dd33b33 (2023-10-04 13:37:54)
│   │   ├───gitignore: github:hercules-ci/gitignore.nix/637db329424fd7e46cf4185293b9cc8c88c95394 (2024-02-28 02:28:52)
│   │   │   └───nixpkgs follows input 'hyprland/pre-commit-hooks/nixpkgs'
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───nixpkgs-stable: github:NixOS/nixpkgs/d063c1dd113c91ab27959ba540c0d9753409edf3 (2024-11-04 17:24:30)
│   ├───systems: github:nix-systems/default-linux/31732fcf5e8fea42e59c2488ad31a0e651500f68 (2023-07-14 15:19:09)
│   └───xdph: github:hyprwm/xdg-desktop-portal-hyprland/d7f18dda5e511749fa1511185db3536208fb1a63 (2024-12-22 22:37:00)
│       ├───hyprland-protocols follows input 'hyprland/hyprland-protocols'
│       ├───hyprlang follows input 'hyprland/hyprlang'
│       ├───hyprutils follows input 'hyprland/hyprutils'
│       ├───hyprwayland-scanner follows input 'hyprland/hyprwayland-scanner'
│       ├───nixpkgs follows input 'hyprland/nixpkgs'
│       └───systems follows input 'hyprland/systems'
├───hyprlock: github:hyprwm/hyprlock/d212f4cc1013f12b6691b0ea851b27c088dd8eb8 (2024-12-27 15:21:02)
│   ├───hyprgraphics: github:hyprwm/hyprgraphics/fb2c0268645a77403af3b8a4ce8fa7ba5917f15d (2024-12-08 18:53:39)
│   │   ├───hyprutils follows input 'hyprlock/hyprutils'
│   │   ├───nixpkgs follows input 'hyprlock/nixpkgs'
│   │   └───systems follows input 'hyprlock/systems'
│   ├───hyprlang: github:hyprwm/hyprlang/16e59c1eb13d9fb6de066f54e7555eb5e8a4aba5 (2024-12-16 15:57:08)
│   │   ├───hyprutils follows input 'hyprlock/hyprutils'
│   │   ├───nixpkgs follows input 'hyprlock/nixpkgs'
│   │   └───systems follows input 'hyprlock/systems'
│   ├───hyprutils: github:hyprwm/hyprutils/104117aed6dd68561be38b50f218190aa47f2cd8 (2024-12-06 16:24:01)
│   │   ├───nixpkgs follows input 'hyprlock/nixpkgs'
│   │   └───systems follows input 'hyprlock/systems'
│   ├───nixpkgs follows input 'nixpkgs'
│   └───systems: github:nix-systems/default-linux/31732fcf5e8fea42e59c2488ad31a0e651500f68 (2023-07-14 15:19:09)
├───hyprpicker: github:hyprwm/hyprpicker/46d2f5a817a89405cef941d8beb4551425acf3da (2024-12-16 21:26:55)
│   ├───hyprutils: github:hyprwm/hyprutils/104117aed6dd68561be38b50f218190aa47f2cd8 (2024-12-06 16:24:01)
│   │   ├───nixpkgs follows input 'hyprpicker/nixpkgs'
│   │   └───systems follows input 'hyprpicker/systems'
│   ├───hyprwayland-scanner: github:hyprwm/hyprwayland-scanner/500c81a9e1a76760371049a8d99e008ea77aa59e (2024-09-20 23:27:16)
│   │   ├───nixpkgs follows input 'hyprpicker/nixpkgs'
│   │   └───systems follows input 'hyprpicker/systems'
│   ├───nixpkgs follows input 'nixpkgs'
│   └───systems: github:nix-systems/default-linux/31732fcf5e8fea42e59c2488ad31a0e651500f68 (2023-07-14 15:19:09)
├───nixpkgs: github:NixOS/nixpkgs/634fd46801442d760e09493a794c4f15db2d0cbb (2024-12-27 09:21:16)
└───stylix: github:danth/stylix/963e77a3a4fc2be670d5a9a6cbeb249b8a43808a (2024-12-26 22:53:19)
    ├───base16: github:SenchoPens/base16.nix/153d52373b0fb2d343592871009a286ec8837aec (2024-11-21 14:52:04)
    │   └───fromYaml: github:SenchoPens/fromYaml/106af9e2f715e2d828df706c386a685698f3223b (2024-11-18 21:47:06)
    ├───base16-fish: github:tomyun/base16-fish/2f6dd973a9075dabccd26f1cded09508180bf5fe (2021-06-01 15:05:57)
    ├───base16-helix: github:tinted-theming/base16-helix/7f795bf75d38e0eea9fed287264067ca187b88a9 (2024-09-09 05:46:35)
    ├───base16-vim: github:tinted-theming/base16-vim/61165b1632409bd55e530f3dbdd4477f011cadc6 (2024-11-18 17:05:48)
    ├───flake-compat: github:edolstra/flake-compat/0f9255e01c2351cc7d116c072cb317785dd33b33 (2023-10-04 13:37:54)
    ├───flake-utils: github:numtide/flake-utils/11707dc2f618dd54ca8739b309ec4fc024de578b (2024-11-13 21:27:16)
    │   └───systems follows input 'stylix/systems'
    ├───gnome-shell: github:GNOME/gnome-shell/dadd58f630eeea41d645ee225a63f719390829dc (2024-11-23 13:50:55)
    ├───home-manager: github:nix-community/home-manager/c1fee8d4a60b89cae12b288ba9dbc608ff298163 (2024-12-01 20:38:04)
    │   └───nixpkgs follows input 'stylix/nixpkgs'
    ├───nixpkgs follows input 'nixpkgs'
    ├───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
    ├───tinted-foot: github:tinted-theming/tinted-foot/fd1b924b6c45c3e4465e8a849e67ea82933fcbe4 (2024-09-21 10:04:00)
    ├───tinted-kitty: github:tinted-theming/tinted-kitty/eb39e141db14baef052893285df9f266df041ff8 (2024-05-23 00:13:09)
    └───tinted-tmux: github:tinted-theming/tinted-tmux/f0e7f7974a6441033eb0a172a0342e96722b4f14 (2024-10-21 09:06:21)

```

### Flake Outputs

```nix
git+file:///home/runner/work/nixflakes/nixflakes?shallow=1
├───devShells
│   └───x86_64-linux
│       └───default: development environment 'nix-shell'
├───formatter
│   └───x86_64-linux: package 'nixfmt-unstable-2024-12-04'
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
