{ hostname, username, ... }:
{
  networking = {
    networkmanager.enable = true;
    hostName = "${hostname}";
    extraHosts = ''
      	192.168.2.195 nixbox
      	192.168.2.196 nixboard
      	192.168.2.197 nixcube
      	192.168.2.198 piZW0
      	192.168.2.199 piZW1
    '';
  };
  users.users.${username} = {
    extraGroups = [ "networkmanager" ];
  };

}
