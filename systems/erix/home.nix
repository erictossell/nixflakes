{ pkgs, home-manager, ... }:
{
  imports = [
    home-manager.nixosModules.default
  ];

  home-manager.users.eriim = { pkgs, ... }: {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "23.05";
    nixpkgs.config.allowUnfree = true;
    
    home.file = {
      ".config/hypr".source = ./dotfiles/hypr;
      ".config/swaylock".source = ./dotfiles/swaylock;
      ".config/waybar".source = ./dotfiles/waybar;
      ".config/wofi".source = ./dotfiles/wofi;
    };
  };
  # ---- System Configurations ----
  networking = {
    hostName = "erix";
  };

}
