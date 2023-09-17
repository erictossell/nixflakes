# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, nixpkgs, home-manager,  ... }:

let
  pkgs = nixpkgs.legacyPackages.x86_64-linux;
  corePackages = import ./packages/core.nix;
  devPackages = import ./packages/dev.nix;
  # hyprlandPackages = import ./packages/hyprland.nix;
in
{
  imports =
    [
      ./custom-hardware.nix
      ./font.nix
      ./hardware-configuration.nix
      ./home.nix

      # Optional Modules
      ./modules/fish.nix
      ./modules/gnome.nix
   #  ./modules/hyprland.nix
   #  ./modules/plasma.nix
      ./modules/starship.nix
      ./modules/virt.nix
   ];
  
  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Enable networking 
  networking = {
    hostName = "erix";
    networkmanager.enable = true;

    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  # Meshnet
  services.tailscale.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
   
  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";
    
  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    layout = "us";
    xkbVariant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.eriim = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "Eriim";
    extraGroups = [ "networkmanager" "wheel" "input" "audio" ];
    # For installing Windows Applications
    packages = with pkgs; [ 
	(wineWowPackages.full.override {
	   wineRelease = "staging";
	   mingwSupport = true;
	})
	winetricks
    ];
  };
  
  security = {

    #Application prompts
    polkit.enable = true;
    
    pam = {
      # Auth with FIDO Keys
      u2f.enable = true;
      
      services = {

        # Sign in with YubiKey
  	login.u2fAuth = true;
	# Sudo with Yubikey
        sudo.u2fAuth = true;

        # Try to unlock keyring on login
	# Used for GPG keys and Account tokens
	login.enableGnomeKeyring = true;
     
      };
    };
  };  
      
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
 
  programs = {
    _1password.enable = true;
    _1password-gui = {
	enable = true;
	polkitPolicyOwners = [ "eriim" ];
    };

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

    dconf.enable = true;
    htop.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    mtr.enable = true;

    steam.enable = true;

    tmux = {
      enable = true;
      clock24 = true;
      newSession = true;
      plugins = with pkgs.tmuxPlugins; [ 
        nord
      ];
    };
  };   

  environment.systemPackages = with pkgs; [
    cpufetch
    easyeffects
    nordic
    obs-studio
    virt-manager   
  ] ++ corePackages ++ devPackages;
  
  # Dont change.
  system.stateVersion = "23.05"; # Did you read the comment?
}
