# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

let
  corePackages = import ./packages/core.nix { inherit  pkgs; };
  desktopPackages = import ./packages/desktop.nix { inherit pkgs; };
  devPackages = import ./packages/dev.nix { inherit pkgs; };
in
{

  # Enable Flakes and nix-commands
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
          
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Enable networking - available with nmcli and nmtui
  networking = {
    hostName = "erix";
    networkmanager.enable = true;
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
      ];
    };
  };   

  environment.systemPackages = with pkgs; desktopPackages ++ corePackages ++ devPackages;
  
  # Dont change.
  system.stateVersion = "23.05"; # Did you read the comment?
}
