{ config, pkgs, ... }:

{
# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.eriim = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "Eriim";
    extraGroups = [ "networkmanager" "wheel" "input" "audio" ];
  };
}
