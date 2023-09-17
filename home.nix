{ config, pkgs, home-manager, ... }:
let
  gnomeHome = import ./modules/gnome-home.nix { inherit pkgs; };
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
      vscode
     ] ++ gnomeHome.home.packages;
    
    programs.bash.enable = true;

    programs.firefox = {
	enable = true;
    };

    programs.chromium = {
    	enable = true;
    };

    programs.git = {
	enable = true;
    };

    programs.neovim = {
	enable = true;
	defaultEditor = true;
	withPython3 = true;
	plugins = with pkgs.vimPlugins; [
		nvim-tree-lua
		nvim-treesitter-parsers.bash
		nvim-treesitter-parsers.dockerfile
		nvim-treesitter-parsers.go 
		nvim-treesitter-parsers.gomod 
		nvim-treesitter-parsers.gosum
		nvim-treesitter-parsers.html
		nvim-treesitter-parsers.javascript
		nvim-treesitter-parsers.json
		nvim-treesitter-parsers.python
		nvim-treesitter-parsers.regex
		nvim-treesitter-parsers.sql		
	];
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
    
    home.file = {
      ".config/btop".source = ./dotfiles/btop;
      ".config/cava".source = ./dotfiles/cava;
      ".config/foot".source = ./dotfiles/foot;
      ".config/hypr".source = ./dotfiles/hypr;
      ".config/nvim".source = ./dotfiles/nvim;
      ".config/swaylock".source = ./dotfiles/swaylock;
      ".config/waybar".source = ./dotfiles/waybar;
      ".config/wofi".source = ./dotfiles/wofi;
      ".gitconfig".source = ./ssh/.gitconfig;
     #".wezterm.lua".source = ./dotfiles/.wezterm.lua;
    };

    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
	autoconnect = [ "qemu:///system" ];
	uris = [ "qemu:///system" ];
      };
    } // gnomeHome.dconf.settings;
  
  };
}
