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
      ".config/hypr".source = ../.1monitor/hypr;
      ".config/swaylock".source = ../.1monitor/swaylock;
      ".config/waybar".source = ../.1monitor/waybar;
      ".config/wofi".source = ../.1monitor/wofi;    
    };
  };

  # ---- System Configurations ----
  # Enable my Lenovo Keyboard
  # boot.kernelParams = [ "i8042.direct" "i8042.dumbkbd" "i915.force_probe=9a49"];
  boot.initrd.luks.devices."luks-7938900d-b219-4a48-8441-88a2ed4c6202".device = "/dev/disk/by-uuid/7938900d-b219-4a48-8441-88a2ed4c6202";

  # Enable networking - available with nmcli and nmtui
  networking = {
    hostName = "${host}";
  }; 
}
