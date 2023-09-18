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
        (import ./systems/erix/hardware-configuration.nix {
          inherit (nixpkgs) lib;
          config = self.nixosConfigurations.erix.config;
          nixpkgs = nixpkgs.outPath;
        })

        # Requires Config
        # Enable Nvidia support
        (import ./modules/nvidia.nix { 
          inherit pkgs;
          config = self.nixosConfigurations.erix.config;
        })
        # Sound and bluetooth
        (import ./systems/generic/bluetooth.nix { 
          inherit pkgs;
          config = self.nixosConfigurations.erix.config;
        })
        (import ./systems/generic/sound.nix { 
          inherit pkgs;
          config = self.nixosConfigurations.erix.config;
        })

        # Home manager files
        (import ./systems/erix/home.nix { inherit pkgs home-manager; })
        (import ./systems/erix/desktop.nix { inherit pkgs;})
        # Requires packages
        (import ./modules/core.nix { inherit pkgs; })     
       
        (import ./modules/security.nix { inherit pkgs;})
        (import ./modules/terminal { inherit pkgs home-manager;})
        (import ./modules/virt.nix { inherit pkgs;})
      ];
    };
  };
}

