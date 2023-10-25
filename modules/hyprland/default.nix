{ pkgs, nvidia_bool, username, ... }:
let
  hyprNvidia = {
    "enabled" = [ (import ./nvidia.nix {inherit pkgs username;}) ];
    "disabled" = [ (import ./standard.nix {inherit pkgs username;}) ];
    };
in
{
  imports = [
    ./config
    ./mako
    ./pkgs
    ./swaylock
    ./waybar
    ./wofi
  ]++ (hyprNvidia.${nvidia_bool} or [ ]);
  environment.systemPackages = with pkgs; [ hyprpaper hyprpicker ];
}
