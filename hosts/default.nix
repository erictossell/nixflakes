{ pkgs, home-manager, username, hostname, ... }:
{
  imports = [
    ./${hostname}
  ];
  home-manager.users.${username} = { pkgs, ... }: {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "23.05";
    nixpkgs.config.allowUnfree = true;
  };
  
}
