{ nixpkgs, ... }:
{
  imports = [
    (nixpkgs + "/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix")
  ];
}
