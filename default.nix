{ home-manager, hyprland, ... }:

{
  imports = [
    home-manager.nixosModules.home-manager
    hyprland.nixosModules.hyprland
    ./hosts
    ./modules
  ];
}
