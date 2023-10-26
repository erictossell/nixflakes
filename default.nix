{ home-manager, hyprland, username, ... }:
{
  imports = [
    home-manager.nixosModules.home-manager
    hyprland.nixosModules.default
    ./assets
    ./hosts
    ./modules
    ./users/${username}
  ];
}
