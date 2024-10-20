{ lib, hostName, username, ... }:
{
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;

  networking = {
    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };
    inherit hostName;
  };
  users.users.${username} = {
    extraGroups = [ "networkmanager" ];
  };
}
