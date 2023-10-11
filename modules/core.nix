{ pkgs, home-manager, user, ... }:
let
  corePackages = import ../pkgs/core.nix { inherit  pkgs; };
  devPackages = import ../pkgs/dev.nix { inherit pkgs; };
in
{ 
  imports = [
    ../users/${user}.nix
  ];

  home-manager.users.${user} = { pkgs, ... }: {
    home.packages = with pkgs; [
      obsidian
     ];
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
  # services.tailscale.enable = true;
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
  environment.systemPackages = corePackages ++ devPackages;
  
  # Dont change.
  system.stateVersion = "23.05"; # Did you read the comment?
}
