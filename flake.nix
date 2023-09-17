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
  in 
  { 
   
    # Defining my desktop set up - requires x86_64 Architecture
    nixosConfigurations.erix = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
     
      modules = [ 
        (import ./hardware-configuration.nix {
          inherit (nixpkgs) lib;
          config = self.nixosConfigurations.erix.config;
          nixpkgs = nixpkgs.outPath;
        })

        # Requires Config
        (import ./custom-hardware.nix { 
          inherit pkgs;
          config = self.nixosConfigurations.erix.config;
        })

        # Home manager files
        (import ./home.nix { inherit pkgs home-manager; })

        # Requires packages
        (import ./core.nix { inherit pkgs; })
        (import ./font.nix { inherit pkgs;})

        (import ./modules/desktop.nix { inherit pkgs;})
        (import ./modules/fish.nix { inherit pkgs;})
        (import ./modules/gnome.nix { inherit pkgs;})
        (import ./modules/security.nix { inherit pkgs;})
        (import ./modules/starship.nix { inherit pkgs;})
        (import ./modules/virt.nix { inherit pkgs;})
      ];
    };
  };
}

