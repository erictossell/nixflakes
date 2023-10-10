{ config, pkgs, user, ... }:

{
# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    shell = pkgs.bash;
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "input" ];
  };
}
