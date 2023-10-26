{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
  }; 
}
