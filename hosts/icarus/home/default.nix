{ pkgs, home-manager, username, hostname, ... }:
{
  imports = [
    home-manager.nixosModules.default
  ];


  home-manager.users.${username} = { pkgs, ... }: {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "23.05";
    nixpkgs.config.allowUnfree = true;

  };

  # ---- System Configurations ----
  boot.initrd.luks.devices."luks-7938900d-b219-4a48-8441-88a2ed4c6202".device = "/dev/disk/by-uuid/7938900d-b219-4a48-8441-88a2ed4c6202";

  # Enable networking - available with nmcli and nmtui
  networking = {
    hostName = "${hostname}";
  }; 
}
