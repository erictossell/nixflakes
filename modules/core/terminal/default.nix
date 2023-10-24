{ pkgs, home-manager, username, ... }:
let
  packages = with pkgs; [
    alacritty # backup terminal
    btop
    nitch
    vim
  ];
in
{  
   imports = [
    ./cava
    ./foot
    ./kitty
    ./nvim
   ];
   # ---- Home Configuration ----
   home-manager.users.${username} = { pkgs, ... }: {
    programs.bash.enable = true;
    programs.git.enable = true;
    programs.vim.enable = true;
  };

  # ---- System Configuration ----
  programs.bash = {
    interactiveShellInit = ''
      	nitch
    '';
    shellAliases = {
	b = "btop";
	e = "exit";
	g = "git";
	n = "nvim";
	t = "tmux";
	r = "ranger";
    };
  };
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      scan_timeout = 10;
      format = ''
  [┌───────────────────>](bold green)
  [│](bold green)$all$username$character$directory$cmd_duration
  [└─>](bold green)
  '';
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
