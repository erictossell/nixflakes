{ ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];
  # ---- System Configurations ----
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ]; # For cross-compiling, https://discourse.nixos.org/t/how-do-i-cross-compile-a-flake/12062/6?u=srid
  networking.firewall.allowedTCPPorts = [ 5900 5901 ];
  networking.firewall.allowedUDPPorts = [ 5900 5901 ];
}
