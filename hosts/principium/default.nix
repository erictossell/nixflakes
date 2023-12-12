{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];
  #----Host specific config ----
  services.gvfs = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [ thunar ];
}
