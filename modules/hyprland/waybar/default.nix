{ pkgs, displayConfig, home-manager, username, ... }:
let
  dotfiles = {
    "1monitor" = [ (import ./1monitor.nix { inherit home-manager username; }) ];
    "3monitor" = [ (import ./3monitor.nix { inherit home-manager username; }) ];
  };
in
{ 
  imports = [
  ] ++ (dotfiles.${displayConfig} or [ ]); 
  environment.systemPackages = with pkgs; [ waybar ];
}
