{ pkgs, home-manager, ... }:
{

  # ---- Home config ----
  home-manager.users.eriim = { pkgs, ... }: {

    home.file = {
      ".config/hypr".source = ./dotfiles/hypr;
    };

  };

  # ---- System Configuration ----
  programs = { 
    hyprland = {
      enable = true;
      xwayland.enable = true;
      enableNvidiaPatches = true;
    };
  };

  #xdg = {
  #  portal = {
  #    enable = true;
  #    wlr.enable = true;
  #  };
  #};
}
