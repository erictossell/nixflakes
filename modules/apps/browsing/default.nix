{ pkgs, home-manager, username, ... }:
{
  #----- Home Manager Config -----
  home-manager.users.${username} = { pkgs, ... }: {
  
    home.packages = with pkgs; [
      nyxt
      qutebrowser
    ];

    home.sessionVariables = {
      MOZ_ENABLE_WAYLAND = 1;
    };
    
    programs = {
      chromium = {
    	enable = true;
      };
      firefox.enable = true;
    };
  };

  #----- System Configuration -----
  programs = {
    chromium = {
	enable = true;
	extraOpts = {
	  "BrowserSignin" = 1;
	  "SyncDisabled" = false;
	  "PasswordManagerEnabled" = false;
	  "SpellcheckEnabled" = true;
	  "SpellcheckLanguage" = [ "en-US" ];
	  };
	extensions = [
	  "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
	  #"aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1password
      ];
    };
  };
}
