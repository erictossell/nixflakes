# A simple host configuration for creating live images
{ nixpkgs, ... }: {
  imports =
    [ (nixpkgs + "/nixos/modules/virtualisation/virtualbox-image.nix") ];
}
