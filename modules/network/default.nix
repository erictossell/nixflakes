{ hostname, username, ... }:
{
  networking = {
    networkmanager.enable = true;
    hostName = "${hostname}";
    extraHosts = ''
	10.0.0.195 nixbox
	10.0.0.196 nixboard
	10.0.0.197 nixcube
	10.0.0.198 piZW0
	10.0.0.199 piZW1
    '';
  };
  users.users.${username} = {
    extraGroups = [ "networkmanager" ];
  };
 
}
