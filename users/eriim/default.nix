{ config, pkgs, user, ... }:

{
# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    shell = pkgs.bash;
    isNormalUser = true;
    description = "Eriim";
    extraGroups = [ "networkmanager" "wheel" "input" "audio" ];
  };
}
