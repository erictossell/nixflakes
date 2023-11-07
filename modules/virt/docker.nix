{ pkgs, username, ... }:
{
  # Docker can also be run rootless
  virtualisation.docker = {
    enable = true;
  };
  # User permissions 
  users.users.${username}.extraGroups = [ "docker" ];


}
