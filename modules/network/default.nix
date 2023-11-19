{ hostname, username, ... }:
{
  networking = {
    networkmanager.enable = true;
    hostName = "${hostname}";
  };
  users.users.${username} = {
    extraGroups = [ "networkmanager" ];
  };
}
