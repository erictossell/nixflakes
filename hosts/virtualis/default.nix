# A simple host configuration for creating live images
{ nixpkgs, ... }:
{
  imports = [
    (nixpkgs + "/nixos/modules/virtualisation/qemu-vm.nix")
    (nixpkgs + "/nixos/modules/virtualisation/qemu-guest-agent.nix")
    #./hardware-configuration.nix
  ];
  virtualisation.vmVariant = {
    virtualisation = {
      memorySize = 4096;
      cores = 2;
    };
  };
}
