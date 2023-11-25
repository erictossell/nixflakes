# A simple host configuration for creating live images
{ nixpkgs, ... }:
{
  imports = [
    (nixpkgs + "/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix")
  ];
}
