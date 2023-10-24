{ pkgs, home-manager, username, hostname, ... }:
{
  imports = [ 
    ./1password
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
