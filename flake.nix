{
  description = "Machine specific configuration flake.";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/hyprland";
    };

  };
  
 
  outputs = { self, nixpkgs, ... } @ attrs: { 

    nixosConfigurations = { 
      retis = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          username = "eriim";
          hostname = "retis";
          displayConfig = "desktop";
          nvidia_bool = "enabled";
        } // attrs;        
        modules = [
          ./.
          ./modules/obs
          ./modules/toys
          ./modules/virt
        ];
      };#retis

      sisyphus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          username = "eriim";
          hostname = "sisyphus";
          displayConfig = "laptop";
          nvidia_bool = "disabled";
        } // attrs;        
        modules = [
            ./.
        ];
      };#sisyphus
      
      live = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          username = "eriim";
          hostname = "live";
          displayConfig = "laptop";
          nvidia_bool = "disabled";
          } // attrs;
          modules = [
            ./.
          ];
      };#live-image

    };
  };
}
