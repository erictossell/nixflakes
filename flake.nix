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

        #Desktop Hardware Configuration
        (import ./systems/erix/hardware-configuration.nix {
          inherit (nixpkgs) lib;
          config = self.nixosConfigurations.erix.config;
          nixpkgs = nixpkgs.outPath;
        })
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
        # Desktop Specific files
        (import ./systems/erix/home.nix { inherit pkgs home-manager; })
        # Core Packages
        (import ./modules/core.nix { inherit pkgs home-manager; })     
        # Security Features
        (import ./modules/security.nix { inherit pkgs;})
        # Terminal Customizations
        (import ./modules/terminal { inherit pkgs home-manager;})
        # Virtualisation
        (import ./modules/virt.nix { inherit pkgs home-manager;})
      ];
    };
    # Defining my laptop set up - requires x86_64 Architecture
    nixosConfigurations.eriix = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
     
      modules = [ 

        #Desktop Hardware Configuration
        (import ./systems/eriix/hardware-configuration.nix {
          inherit (nixpkgs) lib;
          config = self.nixosConfigurations.erix.config;
          nixpkgs = nixpkgs.outPath;
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
        # Laptop Specific files
        (import ./systems/eriix/home.nix { inherit pkgs home-manager; })
        # Core Packages
        (import ./modules/core.nix { inherit pkgs home-manager; })     
        # Security Features
        (import ./modules/security.nix { inherit pkgs;})
        # Terminal Customizations
        (import ./modules/terminal { inherit pkgs home-manager;})
        # Virtualisation
        (import ./modules/virt.nix { inherit pkgs home-manager;})
      ];
    };
  };
}

