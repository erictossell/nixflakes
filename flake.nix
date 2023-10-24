{
  description = "Machine specific configuration flake.";

  # Defining package channels
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    hyprland = {
      url = "github:hyprwm/hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  # Defining flake import structure for packages
  outputs = { self, nixpkgs, home-manager, hyprland, ... }@attrs: 
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in 
  { 
    # Hyprland Desktop - 3 monitors 
    nixosConfigurations.retis = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        username = "eriim";
        hostname = "retis";
        displayConfig = "3monitor";
        gui = "hypr-nvidia";
        nvidia_bool = "enabled";
      } // attrs;        
      modules = [
        ({config, pkgs, home-manager, hyprland, username, hostname, displayConfig, nvidia_bool, ... }: {
          imports = [
            (import ./hosts {
              inherit (nixpkgs) lib pkgs;
              hostname = hostname;
              config = config;
              nixpkgs = nixpkgs.outPath;
            })
            ./modules/core
            ./modules/gui
            ./modules/obs
            ./modules/toys
            ./modules/virt
            ./profiles/smb_client
          ];
        })
      ];
    };#retis

    # Hyprland Laptop 
    nixosConfigurations.sisyphus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        username = "eriim";
        hostname = "sisyphus";
        displayConfig = "1monitor";
        gui = "hypr";
        nvidia_bool = "disabled";
      } // attrs;        
      modules = [
        ({config, pkgs, home-manager, hyprland, username, hostname, displayConfig, nvidia_bool, ... }: {
          imports = [
            (import ./hosts {
              inherit (nixpkgs) lib pkgs;
              hostname = hostname;
              config = config;
              nixpkgs = nixpkgs.outPath;
            })
            ./modules/core
            ./modules/gui
            ./profiles/smb_client
          ];
        })
      ];
    };#sisyphus

    # Hyprland Laptop 
    nixosConfigurations.icarus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        username = "eriim";
        hostname = "icarus";
        displayConfig = "1monitor";
        gui = "hypr";
        nvidia_bool = "disabled";
      } // attrs;        
      modules = [
        ({config, pkgs, home-manager, hyprland, username, hostname, displayConfig, nvidia_bool, ... }: {
          imports = [
            (import ./hosts {
              inherit (nixpkgs) lib pkgs;
              hostname = hostname;
              config = config;
              nixpkgs = nixpkgs.outPath;
            })
            ./modules/core
            ./modules/gui
            ./profiles/smb_client
          ];
        })
      ];
    };#icarus
  };
}

