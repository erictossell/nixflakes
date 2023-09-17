{
  description = "My desktop flake.";

  # Defining package channels
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };
  
  # Defining flake import structure for packages
  outputs = { self, nixpkgs, home-manager, ... }@attrs: 
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;

    importWithPkgs = path: (import path { inherit pkgs; });

    importWithConfig = path: (import path {
      inherit pkgs;
      config = self.nixosConfigurations.erix.config;
    });

    importWithHardwareConfig = (import ./hardware-configuration.nix {
      inherit (nixpkgs) lib;
      config = self.nixosConfigurations.erix.config;
      nixpkgs = nixpkgs.outPath;
    });
  in 
  { 
   
    # Defining my desktop set up - requires x86_64 Architecture
    nixosConfigurations.erix = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        # Hardware configurations
        importWithHardwareConfig
        importWithConfig ./custom-hardware.nix

        # Basic configurations
        importWithPkgs ./configuration.nix
        importWithPkgs ./home.nix
        importWithPkgs ./font.nix

        # Module configurations
        importWithPkgs ./modules/desktop.nix
        importWithPkgs ./modules/fish.nix
        importWithPkgs ./modules/gnome.nix
        importWithPkgs ./modules/security.nix
        importWithPkgs ./modules/starship.nix
        importWithPkgs ./modules/virt.nix
      ];
    };
  };
}

