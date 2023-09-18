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
      ".config/swaylock".source = ../eriix/dotfiles/swaylock;
      ".config/waybar".source = ../eriix/dotfiles/waybar;
      ".config/wofi".source = ../eriix/dotfiles/wofi;    
    };

    home.sessionVariables = {
      MOZ_ENABLE_WAYLAND = 1;
    };
    
    programs = {
      chromium = {
    	enable = true;
      };
 
      obs-studio = {
        enable = true;
        plugins = with pkgs.obs-studio-plugins; [
	  wlrobs
	  obs-vaapi
	  obs-vkcapture
	  obs-pipewire-audio-capture
        ];
      };
    };

    services.easyeffects.enable = true;
    services.gpg-agent.enableFishIntegration = true;
  };


  # ---- System Configurations ----
  users.users.eriim = {
  packages = with pkgs; [ 
      (wineWowPackages.full.override {
        wineRelease = "staging";
	mingwSupport = true;
       })
    winetricks
    ];
  };

  # Enable networking - available with nmcli and nmtui
  networking = {
    hostName = "erix";
  };

  services.xserver = {
    enable = true;
   };

  # Desktop specific programs
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
	  "aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1password
	];
    };

    steam.enable = true;  
  };
}
