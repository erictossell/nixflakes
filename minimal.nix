{ home-manager, ... }:
{
  imports = [
    home-manager.nixosModules.home-manager
    ./users
    ./hosts
    ./modules/core/terminal
    ./modules/core/nix
  ];
}
