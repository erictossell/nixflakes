{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brightnessctl
    gh
    pavucontrol
    playerctl
    musikcube
    ranger
    ripgrep
    unzip
    wget
  ];
}
