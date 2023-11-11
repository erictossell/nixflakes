{ pkgs, home-manager, username, ... }:
{
  imports = [ 
    ./1password
    ./libreoffice
    ./browsing
    ./vscode
  ];
  home-manager.users.${username} = { pkgs, ... }: {
    home.packages = with pkgs; [
      obsidian
      discord
     ];
  };
}
