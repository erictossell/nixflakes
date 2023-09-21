{
  description = "My desktop flake.";

  # Defining package channels
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    hyprland.url = "github:hyprwm/hyprland";
  };
  
  # Defining flake import structure for packages
  outputs = { self, nixpkgs, home-manager, hyprland, ... }@attrs: 
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in 
  { 
   
    # Defining my desktop set up - requires x86_64 Architecture
    nixosConfigurations.erix-gnome = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
     
      modules = [
        # Desktop Environment
        (import ./modules/gnome.nix { inherit pkgs home-manager; })

        #Desktop Hardware Configuration
        (import ./systems/erix/hardware-configuration.nix {
          inherit (nixpkgs) lib;
          config = self.nixosConfigurations.erix-gnome.config;
          nixpkgs = nixpkgs.outPath;
        })

        # Enable Nvidia support
        (import ./modules/nvidia.nix { 
          inherit pkgs;
          config = self.nixosConfigurations.erix-gnome.config;
        })

        # Sound and bluetooth
        (import ./systems/generic/bluetooth.nix { 
          inherit pkgs;
          config = self.nixosConfigurations.erix-gnome.config;
        })

        (import ./systems/generic/sound.nix { 
          inherit pkgs;
          config = self.nixosConfigurations.erix-gnome.config;
        })

        # Desktop Specific files
        (import ./systems/erix/home.nix { inherit pkgs home-manager; })
        # Chromium Firefox Nyxt
        (import ./modules/browsers.nix { inherit pkgs home-manager;})
        # Core Packages
        (import ./modules/core.nix { inherit pkgs home-manager; })     
        # OBS-Studio
        (import ./modules/obs.nix { inherit pkgs home-manager;})
        # Security Features
        (import ./modules/security.nix { inherit pkgs;})
        # Terminal Customizations
        (import ./modules/terminal { inherit pkgs home-manager;})
        # Video game things
        (import ./modules/vidya.nix { inherit pkgs;})
        # Virtualisation
        (import ./modules/virt.nix { inherit pkgs home-manager;})
      ];
    };
    
    # Defining my desktop-hyprland set up - requires x86_64 Architecture
    nixosConfigurations.erix-hyprland = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
     
      modules = [

        # Hyprland WM
        hyprland.nixosModules.default
        (import ./modules/hyprland-nvidia.nix { inherit pkgs hyprland; })

        #Desktop Hardware Configuration
        (import ./systems/erix/hardware-configuration.nix {
          inherit (nixpkgs) lib;
          config = self.nixosConfigurations.erix-hyprland.config;
          nixpkgs = nixpkgs.outPath;
        })

        # Enable Nvidia support
        (import ./modules/nvidia.nix { 
          inherit pkgs;
          config = self.nixosConfigurations.erix-hyprland.config;
        })

        # Sound and bluetooth
        (import ./systems/generic/bluetooth.nix { 
          inherit pkgs;
          config = self.nixosConfigurations.erix-hyprland.config;
        })

        (import ./systems/generic/sound.nix { 
          inherit pkgs;
          config = self.nixosConfigurations.erix-hyprland.config;
        })
        
        # Desktop Specific files
        (import ./systems/erix/home.nix { inherit pkgs home-manager; })
        # Chromium Firefox Nyxt
        (import ./modules/browsers.nix { inherit pkgs home-manager;})
        # Core Packages
        (import ./modules/core.nix { inherit pkgs home-manager; })     
        # Security Features
        (import ./modules/security.nix { inherit pkgs;})
        # OBS-Studio
        (import ./modules/obs.nix { inherit pkgs home-manager;})
        # Terminal Customizations
        (import ./modules/terminal { inherit pkgs home-manager;})
        # Video game things
        (import ./modules/vidya.nix { inherit pkgs;})
        # Virtualisation
        (import ./modules/virt.nix { inherit pkgs home-manager;})
      ];
    };

    # Defining my laptop set up - requires x86_64 Architecture
    nixosConfigurations.eriix = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
     
      modules = [ 
        # Hyprland WM
        (import ./modules/hyprland.nix { inherit pkgs; })
        
        #Laptop Hardware Configuration
        (import ./systems/eriix/hardware-configuration.nix {
          inherit (nixpkgs) lib;
          config = self.nixosConfigurations.eriix.config;
          nixpkgs = nixpkgs.outPath;
        })

        # Sound and bluetooth
        (import ./systems/generic/bluetooth.nix { 
          inherit pkgs;
          config = self.nixosConfigurations.eriix.config;
        })

        (import ./systems/generic/sound.nix { 
          inherit pkgs;
          config = self.nixosConfigurations.eriix.config;
        })

        # Laptop Specific files
        (import ./systems/eriix/home.nix { inherit pkgs home-manager; })
        #Browsers - Chromem Nyxt, Firefox
        (import ./modules/browsers.nix { inherit pkgs home-manager; })
        # Core Packages
        (import ./modules/core.nix { inherit pkgs home-manager; })     
        # Security Features
        (import ./modules/security.nix { inherit pkgs;})
        # Terminal Customizations
        (import ./modules/terminal { inherit pkgs home-manager;})
      ];
    };
  };
}

