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
 
      principium =
      let system = "x86_64-linux";
      in nixpkgs.lib.nixosSystem {
	specialArgs = {
          username = "eriim";
          hostname = "principium";
          hyprlandConfig = "desktop";
          nvidia_bool = "enabled";
	  inherit system;
        } // attrs;        
        modules = [
          ./.
          ./modules/apps/obs
          ./modules/toys
          ./modules/virt
        ];
      };#principium

      sisyphus =
      let system = "x86_64-linux";
      in nixpkgs.lib.nixosSystem {
        specialArgs = {
          username = "eriim";
          hostname = "sisyphus";
          hyprlandConfig = "laptop";
          nvidia_bool = "disabled";
	  inherit system;
        } // attrs;        
        modules = [
            ./.
        ];
      };#sisyphus

      live-image = 
      let system = "x86_64-linux";
      in nixpkgs.lib.nixosSystem {
        system = system;
        specialArgs = {
          username = "nixos";
          hostname = "live-image";
          hyprlandConfig = "laptop";
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
