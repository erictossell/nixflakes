{ pkgs, hyprland, ... }:

{
  environment.systemPackages = with pkgs; [
    hyprland.packages.${system}.hyprland
  ];


}
