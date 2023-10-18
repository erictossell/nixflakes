{ pkgs, home-manager, username, hostname, ... }:
{
  home-manager.users.${username} = { pkgs, ... }: {
    home.packages = with pkgs; [
      obsidian
      discord
     ];
  };
}