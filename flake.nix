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
     
      # A minimal dev-vm config for building custom ISO's
      live-image = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          username = "nixos";
          hostname = "live-image";
          displayConfig = "laptop";
          nvidia_bool = "disabled";
          } // attrs;
          modules = [
            ./minimal.nix
          ];
      };#live-image
      
      live-image-hyprland = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          username = "nixos";
          hostname = "live-image";
          displayConfig = "laptop";
          nvidia_bool = "disabled";
          } // attrs;
          modules = [
            ./minimal.nix
            ./modules/hyprland
            ./assets
          ];
      };#live-image

    };#configurations

    templates.default = {
      path = ./.;
      description = "The default template for this flake";
    };#templates
    
  };
}
