{
  description = "Machine specific configuration flake.";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
	url = "github:ryantm/agenix";
	inputs.nixpkgs.follows = "nixpkgs";
	inputs.darwin.follows = "";
    };

    hyprland = {
      url = "github:hyprwm/hyprland";
    };
    
    eriixvim = {
      url = "github:erictossell/eriixvim";
    };
  };
  
  outputs = { self, nixpkgs, ... } @ attrs: { 

    nixosConfigurations = { 
 
      principium = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          username = "eriim";
          hostname = "principium";
          displayConfig = "desktop";
          nvidia_bool = "enabled";
        } // attrs;        
        modules = [
          ./.
          ./modules/obs
          ./modules/toys
          ./modules/virt
        ];
      };#principium

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

    };#configurations

    templates.default = {
      path = ./.;
      description = "The default template for this flake";
    };#templates
   
  };
}
