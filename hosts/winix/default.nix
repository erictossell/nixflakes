{ config, lib, username, hostname, pkgs, NixOS-WSL, ... }:

{
  imports = [
    NixOS-WSL.nixosModules.wsl
  ];
  wsl.enable = true;
  wsl.defaultUser = "${username}";
  wsl.nativeSystemd = true;

  networking.hostName = "${hostname}";

}
