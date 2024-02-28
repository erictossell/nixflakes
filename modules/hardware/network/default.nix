{ hostName, username, ... }: {
  networking = {
    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };
    inherit hostName;
  };
  users.users.${username} = { extraGroups = [ "networkmanager" ]; };
}
