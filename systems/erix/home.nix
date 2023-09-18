{ pkgs, home-manager, ... }:
let
  #gnomeHome = import ./gnome-home.nix { inherit pkgs home-manager; };
  gnome = import ./gnome.nix { inherit pkgs home-manager; };

in
{
  imports = [
    home-manager.nixosModules.default
  ];

  home-manager.users.eriim = { pkgs, ... }: {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "23.05";

    nixpkgs.config.allowUnfree = true;

    home.sessionVariables = {
      MOZ_ENABLE_WAYLAND = 1;
    };

    home.packages = with pkgs; [
      discord
      nyxt
      obsidian
      
     ] ++ gnome.home.packages;
    

   

    programs.firefox = {
	enable = true;
    };

    programs.chromium = {
    	enable = true;
    };
    programs.obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
	wlrobs
	obs-vaapi
	obs-vkcapture
	obs-pipewire-audio-capture
      ];
    };

    programs.vscode.enable = true;

    home.file = {
      #".config/hypr".source = ./dotfiles/hypr;
      #".config/swaylock".source = ./dotfiles/swaylock;
      #".config/waybar".source = ./dotfiles/waybar;
      #".config/wofi".source = ./dotfiles/wofi;
      #".gitconfig".source = ./ssh/.gitconfig;
     #".wezterm.lua".source = ./dotfiles/.wezterm.lua;
    };

    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
	autoconnect = [ "qemu:///system" ];
	uris = [ "qemu:///system" ];
      };
    } // gnome.dconf.settings;
  };
}
