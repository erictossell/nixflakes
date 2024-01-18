{ pkgs, home-manager, username, ... }:
{
  imports = [
    ./1password
    ./browsing
    #./libreoffice
    # Electron Issues - I'm just editting markdown at the moment.
    #./obsidian
    ./vscode
  ];
}
