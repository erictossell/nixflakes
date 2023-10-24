{pkgs, home-manager, username, ... }:
{
  imports = [ (import ./dots {inherit home-manager username;}) ];
  environment.systemPackages = with pkgs; [
    kitty
  ];

}
