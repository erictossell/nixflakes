{ pkgs, home-manager, user, host, ... }:
{
  imports = [
    home-manager.nixosModules.default
  ];

  home-manager.users.${user} = { pkgs, ... }: {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "23.05";
    nixpkgs.config.allowUnfree = true;

    home.file = {
      ".config/hypr".source = ../.dotfiles/1monitor/hypr;
      ".config/swaylock".source = ../.dotfiles/shared/swaylock;
      ".config/waybar".source = ../.dotfiles/shared/waybar;
      ".config/wofi".source = ../.dotfiles/1monitor/wofi;    
    };
  };

  # ---- System Configurations ----
  # Enable my Lenovo Keyboard
  boot.kernelParams = [ "i8042.direct" "i8042.dumbkbd" "i915.force_probe=9a49"];
   
  # Enable networking - available with nmcli and nmtui
  networking = {
    hostName = "${host}";
  }; 
}
