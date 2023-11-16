{ hostname, username, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];
  # ---- System Configurations ----
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ]; # For cross-compiling, https://discourse.nixos.org/t/how-do-i-cross-compile-a-flake/12062/6?u=srid
  networking.firewall.allowedTCPPorts = [ 5900 5901 ];
  networking.firewall.allowedUDPPorts = [ 5900 5901 ];
  # ---- System Configurations ----
  networking = {
    networkmanager.enable = true;
    hostName = "${hostname}";
  };
  users.users.${username} = {
    extraGroups = [ "networkmanager" ];
  };
  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";
    
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };
}
