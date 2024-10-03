{
  home-manager,
  envfs,
  pkgs,
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


  # packageOverrides = pkgs_: (with pkgs_; {
  #   # stable = import <nixos> { inherit config; };
  #   # unstable = import <unstable> { inherit config; };
  #   nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") { pkgs = pkgs_; };
  #   #inherit cuda9-shell cuda10-shell cuda-shell;
  #   #inherit clang7-shell clang-shell;
  # });
}
