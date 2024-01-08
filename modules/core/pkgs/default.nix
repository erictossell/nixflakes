{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brightnessctl
    gh
    pavucontrol
    playerctl
    ranger
    ripgrep
    unzip
    wget
  ];
}
