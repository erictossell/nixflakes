{ config, pkgs, virt-user, ... }:

{
# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${virt-user} = {
    shell = pkgs.bash;
    password = "temp123";
    isNormalUser = true;
    extraGroups = [ "input" "networkmanager" "netdev" ];
  };
}
