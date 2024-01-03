{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brightnessctl
    glow
    gh
    pavucontrol
    playerctl
    ranger
    ripgrep
    unzip
    wget
  ];
}
