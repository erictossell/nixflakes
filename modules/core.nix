# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, home-manager, ... }:

let
  corePackages = import ../packages/core.nix { inherit  pkgs; };
  desktopPackages = import ../packages/desktop.nix { inherit pkgs; };
  devPackages = import ../packages/dev.nix { inherit pkgs; };
  hyprPackages = import ../packages/hyprland.nix { inherit pkgs; };
in
{ 
  home-manager.users.eriim = { pkgs, ... }: {
    home.packages = with pkgs; [
      discord
      nyxt
      obsidian
     ];

     programs = {
      firefox.enable = true;
      vscode.enable = true;
     };
  };

  # Enable Flakes and nix-commands
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
          
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  # Meshnet
  services.tailscale.enable = true;
  # Enable networking - available with nmcli and nmtui
  networking = {
    networkmanager.enable = true;
  };
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
   
  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";
    
  services.xserver = {
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
  
  environment.systemPackages = with pkgs; hyprPackages ++desktopPackages ++ corePackages ++ devPackages;
  
  # Dont change.
  system.stateVersion = "23.05"; # Did you read the comment?
}
