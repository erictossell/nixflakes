{ pkgs, ... }:
{
  programs.hyprland = {
    enableNvidiaPatches = true;
  }; 
}
