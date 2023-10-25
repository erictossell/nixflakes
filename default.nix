{ home-manager, hyprland, ... }:
{
  imports = [
    home-manager.nixosModules.home-manager
    hyprland.nixosModules.default
    ./assets
    ./hosts
    ./modules
  ];
}
