{
  home-manager,
  envfs,
  ...
}: {
  imports = [
    home-manager.nixosModules.home-manager
    ./assets
    ./hosts
    ./modules
    ./users
  ];

  # Enable envfs
  services.envfs.enable = true;

  # Setup nix-ld
  programs.nix-ld.enable = true;
}
