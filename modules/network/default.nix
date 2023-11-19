{ hostname, username, ... }:
{
  imports = [
    ./tailscale.nix
  ];
  networking = {
    networkmanager.enable = true;
    hostName = "${hostname}";
  };
  users.users.${username} = {
    extraGroups = [ "networkmanager" ];
  };
}
