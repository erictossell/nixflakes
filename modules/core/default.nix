{ pkgs, home-manager, username, hostname, ... }:
let
  corePackages = import ./pkgs/core { inherit  pkgs; };
  devPackages = import ./pkgs/dev { inherit pkgs; };
in
{ 
  imports = [
    ./boot/systemd
    ./terminal
    ./security
  ];

  home-manager.users.${username} = { pkgs, ... }: {
    programs.gh.enable = true;
  };
  
  # Enable Flakes and nix-commands
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
          
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
 
  

  environment.systemPackages = corePackages ++ devPackages;
  
  # Dont change.
  system.stateVersion = "23.05"; # Did you read the comment?
}
