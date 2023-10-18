{ config, pkgs, username, ... }:
{
# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    shell = pkgs.bash;
    isNormalUser = true;

    extraGroups = [ "networkmanager" "wheel" "input" "audio" ];
  };
}