{ pkgs, home-manager, username, ... }:
{  
   imports = [
    ./bash
    ./cava
    ./foot
    ./kitty
    ./nvim
    ./starship
   ];
   # ---- Home Configuration ----
   home-manager.users.${username} = { pkgs, ... }: {
    programs.git.enable = true;
    programs.vim.enable = true;
  };

  # ---- System Configuration ----
  programs = {
    htop.enable = true;
    mtr.enable = true;  
    tmux = {
      enable = true;
      clock24 = true;
      newSession = true;
      plugins = with pkgs.tmuxPlugins; [ 
	catppuccin
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

   environment.systemPackages = with pkgs; [
     alacritty # backup terminal
     btop
     nitch
     vim
   ];
}
