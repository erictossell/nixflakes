{
  description = "Eriim's machine specific configuration flake.";
  
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

    russh = {
      url = "github:erictossell/russh";
    };
    
    NixOS-WSL = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
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
	  inherit system;
        } // attrs;        
        modules = [
          ./.
	  ./modules/hardware/nvidia
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
	  inherit system;
        } // attrs;        
        modules = [
            ./.
	    ./modules/GoSSH
	    ./modules/russh
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
	  inherit system;
          } // attrs;
          modules = [
            ./minimal.nix
          ];
      };#live-image

      winix = 
      let system = "x86_64-linux";
      in nixpkgs.lib.nixosSystem {
        system = system;
        specialArgs = {
          username = "eriim";
          hostname = "winix";
	  inherit system;
        } // attrs;
        modules = [
          ./wsl.nix         
        ];
      };#winix-wsl

    };#configurations

    templates.default = {
      path = ./.;
      description = "The default template for Eriim's nixflakes.";
    };#templates
   
  };
}
