{ config, lib, pkgs, NixOS-WSL, ... }:

{
  imports = [
    NixOS-WSL.nixosModules.wsl
  ]
  wsl.enable = true;
  wsl.defaultUser = "eriim";
  wsl.nativeSystemd = true;

  networking.hostName = "winders";

}