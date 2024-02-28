{ home-manager, nixpkgs, ... }: {
  imports = [
    home-manager.nixosModules.home-manager
    { nix.registry.nixpkgs.flake = nixpkgs; }
    ./hosts
    ./modules/core/terminal
    ./modules/core/nix
  ];

}
