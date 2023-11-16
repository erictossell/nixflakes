{ pkgs, home-manager, username, hostname, ... }:
{ 
  imports = [
    ./pkgs
    ./security
    ./terminal
  ];
}
