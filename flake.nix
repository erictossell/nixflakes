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
      specialArgs = {
        user = "eriim";
        host = "erix";
      } // attrs;     
      modules = let
        commonConfig = self.nixosConfigurations.erix-gnome.config;

        configModules = {
          nvidia = { modulePath = "${self}/modules/nvidia.nix"; args = { inherit pkgs; config = commonConfig; }; };
          bluetooth = { modulePath = "${self}/systems/generic/bluetooth.nix"; args = { inherit pkgs; config = commonConfig; }; };
          sound = { modulePath = "${self}/systems/generic/sound.nix"; args = { inherit pkgs; config = commonConfig; }; };
          hardwareConfig = { modulePath = "${self}/systems/erix/hardware-configuration.nix"; args = { inherit (nixpkgs) lib pkgs; config = commonConfig; nixpkgs = nixpkgs.outPath; }; };
        };      
      in [
        ({pkgs, home-manager, user, host, ... }: {
          imports = [
            # Desktop Specific files
            ./systems/erix/home.nix
    
            # Chromium Firefox Nyxt
            ./modules/browsers.nix
    
            # Core Packages
            ./modules/core.nix
    
            # Core Packages
            ./modules/gnome.nix

            # OBS-Studio
            ./modules/obs.nix
    
            # Security Features
            ./modules/security.nix
    
            # Terminal Customizations
            ./modules/terminal
    
            # Video game things
            ./modules/vidya.nix
    
            # Virtualisation
            ./modules/virt.nix
          ];
        })
      ] ++ (nixpkgs.lib.mapAttrsToList (name: value: import value.modulePath value.args) configModules);
    };
   
    # Defining my desktop-hyprland set up - requires x86_64 Architecture
    nixosConfigurations.erix-hyprland = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        user = "eriim";
        host = "erix";
      } // attrs;        
      modules = let
        commonConfig = self.nixosConfigurations.erix-hyprland.config;

        configModules = {
          nvidia = { modulePath = "${self}/modules/nvidia.nix"; args = { inherit pkgs; config = commonConfig; }; };
          bluetooth = { modulePath = "${self}/systems/generic/bluetooth.nix"; args = { inherit pkgs; config = commonConfig; }; };
          sound = { modulePath = "${self}/systems/generic/sound.nix"; args = { inherit pkgs; config = commonConfig; }; };
          hardwareConfig = { modulePath = "${self}/systems/erix/hardware-configuration.nix"; args = { inherit (nixpkgs) lib pkgs; config = commonConfig; nixpkgs = nixpkgs.outPath; }; };
        };      
      in [
        ({pkgs, home-manager, hyprland, user, host, ... }: {
          imports = [
            # Desktop Specific files
            ./systems/erix/home.nix
    
            # Chromium Firefox Nyxt
            ./modules/browsers.nix
    
            # Core Packages
            ./modules/core.nix
    
            # Core Packages
            ./modules/hyprland-nvidia.nix

            # OBS-Studio
            ./modules/obs.nix
    
            # Security Features
            ./modules/security.nix
    
            # Terminal Customizations
            ./modules/terminal
    
            # Video game things
            ./modules/vidya.nix
    
            # Virtualisation
            ./modules/virt.nix
          ];
        })
      ] ++ (nixpkgs.lib.mapAttrsToList (name: value: import value.modulePath value.args) configModules);
    };

    nixosConfigurations.eriix-hyprland = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        user = "eriim";
        host = "eriix";
      } // attrs;        
      modules = let
        commonConfig = self.nixosConfigurations.eriix-hyprland.config;

        configModules = {
          bluetooth = { modulePath = "${self}/systems/generic/bluetooth.nix"; args = { inherit pkgs; config = commonConfig; }; };
          sound = { modulePath = "${self}/systems/generic/sound.nix"; args = { inherit pkgs; config = commonConfig; }; };
          hardwareConfig = { modulePath = "${self}/systems/eriix/hardware-configuration.nix"; args = { inherit (nixpkgs) lib pkgs; config = commonConfig; nixpkgs = nixpkgs.outPath; }; };
        };      
      in [
        ({pkgs, home-manager, hyprland, user, host, ... }: {
          imports = [
            # Desktop Specific files
            ./systems/eriix/home.nix
    
            # Chromium Firefox Nyxt
            ./modules/browsers.nix
    
            # Core Packages
            ./modules/core.nix
    
            # Core Packages
            ./modules/hyprland.nix

            # Security Features
            ./modules/security.nix
    
            # Terminal Customizations
            ./modules/terminal
    
          ];
        })
      ] ++ (nixpkgs.lib.mapAttrsToList (name: value: import value.modulePath value.args) configModules);
    };

  };
}

