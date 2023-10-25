{
  description = "Machine specific configuration flake.";

  # Defining package channels
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  
  # Defining flake import structure for packages
  outputs = { self, nixpkgs, ... } @ attrs: { 
    
    # Hyprland Desktop - 3 monitors 
    nixosConfigurations.retis = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        username = "eriim";
        hostname = "retis";
        displayConfig = "3monitor";
        nvidia_bool = "enabled";
      } // attrs;        
      modules = [
            ./.
            ./modules/obs
            ./modules/toys
            ./modules/virt
          ];
    };#retis

    # Hyprland Laptop 
    nixosConfigurations.sisyphus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        username = "eriim";
        hostname = "sisyphus";
        displayConfig = "1monitor";
        nvidia_bool = "disabled";
      } // attrs;        
      modules = [
            ./.
          ];
    };#sisyphus

    # Hyprland Laptop 
    nixosConfigurations.icarus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        username = "eriim";
        hostname = "icarus";
        displayConfig = "1monitor";
        nvidia_bool = "disabled";
      } // attrs;        
      modules = [
            ./.
          ];
    };#icarus

  };
}

