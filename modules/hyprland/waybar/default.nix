{ pkgs, hyprlandConfig, home-manager, username, ... }:
let
  dotfiles = {
    "laptop" = [ (import ./laptop.nix { inherit home-manager username; }) ];
    "desktop" = [ (import ./desktop.nix { inherit home-manager username; }) ];
  };
in {
  imports = dotfiles.${hyprlandConfig} or [ ];
  environment.systemPackages = with pkgs; [ waybar ];
}
