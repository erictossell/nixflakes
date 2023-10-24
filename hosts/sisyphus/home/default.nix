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
  # Enable my Lenovo Keyboard
  boot.kernelParams = [ "i8042.direct" "i8042.dumbkbd" "i915.force_probe=9a49"];
   
  # Enable networking - available with nmcli and nmtui
  networking = {
    hostName = "${hostname}";
  }; 
}
