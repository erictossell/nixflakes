{ config, pkgs, user, ... }:

{
# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    shell = pkgs.bash;
    password = "temp123";
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "input" ];
  };
}
