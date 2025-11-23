{disko, ... }:
{
  imports = [
    disko.nixosModules.disko
    ./hardware-configuration.nix
  ];
  #----Host specific config ----
}
