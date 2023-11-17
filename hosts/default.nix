{ pkgs, home-manager, username, hostname, ... }:
{
  imports = [
    ./${hostname}
    ./internationalisation
  ];

  home-manager.users.${username} = { pkgs, ... }: {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "23.05";
    nixpkgs.config.allowUnfree = true;
  };

  # ----- System Config -----
  # Enable Flakes and nix-commands
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
          
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
   
  # Dont change.
  system.stateVersion = "23.05"; # Did you read the comment?

}
