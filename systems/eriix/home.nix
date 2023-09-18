{ pkgs, home-manager, ... }:
let
  #gnome = import ../../modules/gnome.nix { inherit pkgs home-manager; };
  hyprlandPackages = import ../../packages/hyprland.nix { inherit pkgs; };
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

    home.file = {
      ".config/swaylock".source = ../../modules/dotfiles/swaylock;
      ".config/waybar".source = ../../modules/dotfiles/waybar;
      ".config/wofi".source = ../../modules/dotfiles/wofi;    
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

  boot.kernelParams = [ "i8042.direct" "i8042.dumbkbd" "i915.force_probe=9a49"];
  # use wayland where possile
  environment.variables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = hyprlandPackages;
  # Enable networking - available with nmcli and nmtui
  networking = {
    hostName = "eriix";
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
  };
}
