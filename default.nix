{ home-manager, username, ... }:
{
  imports = [
    home-manager.nixosModules.home-manager
    ./assets
    ./hosts
    ./modules
    ./users/${username}
  ];
}
