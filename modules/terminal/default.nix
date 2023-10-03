{ pkgs, home-manager, user, ... }:
let
  packages = with pkgs; [
    alacritty # backup terminal
    btop
    cava
    foot
    nitch
    vim
  ];
in
{  
   # ---- Home Configuration ----
   home-manager.users.${user} = { pkgs, ... }: {
     home.file = {
       ".config/cava".source = ./dotfiles/cava;
       ".config/foot".source = ./dotfiles/foot;     
       ".config/nvim".source = ./dotfiles/nvim;
     };

     programs.bash.enable = true;
     programs.git.enable = true;

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
		nvim-treesitter-parsers.nix
		nvim-treesitter-parsers.python
		nvim-treesitter-parsers.regex
		nvim-treesitter-parsers.sql		
	];
    };

    programs.vim.enable = true;
    #programs.wezterm.enable = true;
    services.gpg-agent.enableFishIntegration = true;
  };

  # ---- System Configuration ----
 
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
	set fish_greeting # Disable greeting
	clear
	nitch
	'';
   };

   programs.starship = {
	enable = true;
	settings = {
		add_newline = false;
		scan_timeout = 10;
		format = ''[┌───────────────────>](bold green)
[│](bold green)$all$username$character$directory$cmd_duration
[└─>](bold green)'';
		username = {
		  style_user = "green";
		  style_root = "red";
		  format = "[$user]($style) ";
		  disabled = false;
		  show_always = true;
		};
		cmd_duration = {
			min_time = 500;
			format = "previous took [$duration](bold yellow)";
		};
		localip = {
			ssh_only = true;
			format = "@[$localipv4](bold green) ";
		};
		directory = {
			read_only = " 󰌾";
		};
		docker_context = {
			symbol = " ";
		};
		git_branch = {
			symbol = " ";
		};
		golang = {
			symbol = " ";	
		};
		hostname = {
			ssh_symbol = " ";
		};
		nix_shell = {
			symbol = " ";
		};
		python = {
			symbol = " ";
		};
		os.symbols = {
			NixOS = " ";
		};		
	};
  };

  programs = {
    htop.enable = true;
    mtr.enable = true;  
    tmux = {
      enable = true;
      clock24 = true;
      newSession = true;
      plugins = with pkgs.tmuxPlugins; [ 
	nord
	yank
      ];
    };
  };

  fonts = {
    packages = with pkgs; [ 
	(callPackage (import ./fonts/MplusCodeNerdFont) {})
	nerdfonts
	noto-fonts
	noto-fonts-cjk
	noto-fonts-emoji
	roboto
	];
	fontconfig.defaultFonts = {
		serif = ["Roboto Serif" "Noto Color Emoji"];
		sansSerif = [ "Roboto" "Noto Color Emoji" ];
		emoji = [ "Noto Color Emoji" ];
	};
   };

   environment.systemPackages = packages;
}
