{ config, pkgs, user, ... }:

{
# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "input" ];
  };
}
