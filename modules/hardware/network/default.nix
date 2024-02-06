{ hostName, username, ... }:
{
  networking = {
    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };

    inherit hostName;
    extraHosts = ''
      	192.168.2.195 nixbox
      	192.168.2.196 nixboard
      	192.168.2.197 nixcube
    '';
  };
  users.users.${username} = {
    extraGroups = [ "networkmanager" ];
  };
}
