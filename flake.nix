{
  description = "Machine specific configuration flake.";

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
    
    # Gnome Desktop - PopShell
    nixosConfigurations.desktop-gnome = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        user = "eriim";
        host = "retis";
      } // attrs;        
      modules = let
        commonConfig = self.nixosConfigurations.desktop-gnome.config;

        configModules = {
          nvidia = { modulePath = "${self}/modules/nvidia.nix"; args = { inherit pkgs; config = commonConfig; }; };
          bluetooth = { modulePath = "${self}/modules/bluetooth.nix"; args = { inherit pkgs; config = commonConfig; }; };
          sound = { modulePath = "${self}/modules/sound.nix"; args = { inherit pkgs; config = commonConfig; }; };
          hardwareConfig = { modulePath = "${self}/hosts/retis/hardware-configuration.nix"; args = { inherit (nixpkgs) lib pkgs; config = commonConfig; nixpkgs = nixpkgs.outPath; }; };
        };      
      in [
        ({pkgs, home-manager, user, host, ... }: {
          imports = [
           # Core Packages
            ./modules/core.nix
    
            # Core Packages
            ./modules/gui/gnome.nix
 
            # Video game things
            ./modules/vidya.nix
    
            # Virtualisation
            ./modules/virt.nix
          ];
        })
      ] ++ (nixpkgs.lib.mapAttrsToList (name: value: import value.modulePath value.args) configModules);
    };
    # KDE-Plasma Desktop 
    nixosConfigurations.desktop-plasma = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        user = "eriim";
        host = "retis";
      } // attrs;        
      modules = let
        commonConfig = self.nixosConfigurations.desktop-plasma.config;

        configModules = {
          nvidia = { modulePath = "${self}/modules/nvidia.nix"; args = { inherit pkgs; config = commonConfig; }; };
          bluetooth = { modulePath = "${self}/modules/bluetooth.nix"; args = { inherit pkgs; config = commonConfig; }; };
          sound = { modulePath = "${self}/modules/sound.nix"; args = { inherit pkgs; config = commonConfig; }; };
          hardwareConfig = { modulePath = "${self}/hosts/retis/hardware-configuration.nix"; args = { inherit (nixpkgs) lib pkgs; config = commonConfig; nixpkgs = nixpkgs.outPath; }; };
        };      
      in [
        ({pkgs, home-manager, user, host, ... }: {
          imports = [  
            # Core Packages
            ./modules/core.nix
    
            # Desktop Environment
            ./modules/gui/plasma.nix

            # Video game things
            ./modules/vidya.nix
    
            # Virtualisation
            ./modules/virt.nix
          ];
        })
      ] ++ (nixpkgs.lib.mapAttrsToList (name: value: import value.modulePath value.args) configModules);
    };

    # Hyprland Desktop - 3 monitors 
    nixosConfigurations.retis = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        user = "eriim";
        host = "retis";
      } // attrs;        
      modules = let
        commonConfig = self.nixosConfigurations.retis.config;

        configModules = {
          nvidia = { modulePath = "${self}/modules/nvidia.nix"; args = { inherit pkgs; config = commonConfig; }; };
          bluetooth = { modulePath = "${self}/modules/bluetooth.nix"; args = { inherit pkgs; config = commonConfig; }; };
          sound = { modulePath = "${self}/modules/sound.nix"; args = { inherit pkgs; config = commonConfig; }; };
          hardwareConfig = { modulePath = "${self}/hosts/retis/hardware-configuration.nix"; args = { inherit (nixpkgs) lib pkgs; config = commonConfig; nixpkgs = nixpkgs.outPath; }; };
        };      
      in [
        ({pkgs, home-manager, hyprland, user, host, ... }: {
          imports = [
            # Core Packages
            ./modules/core.nix
    
            # Core Packages
            ./modules/gui/hyprland-nvidia.nix
   
            # Video game things
            ./modules/vidya.nix
    
            # Virtualisation
            ./modules/virt.nix
          ];
        })
      ] ++ (nixpkgs.lib.mapAttrsToList (name: value: import value.modulePath value.args) configModules);
    };

    # Hyprland Laptop - no extra toys
    nixosConfigurations.sisyphus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        user = "eriim";
        host = "sisyphus";
      } // attrs;        
      modules = let
        commonConfig = self.nixosConfigurations.sisyphus .config;

        configModules = {
          bluetooth = { modulePath = "${self}/modules/bluetooth.nix"; args = { inherit pkgs; config = commonConfig; }; };
          sound = { modulePath = "${self}/modules/sound.nix"; args = { inherit pkgs; config = commonConfig; }; };
          hardwareConfig = { modulePath = "${self}/hosts/sisyphus/hardware-configuration.nix"; args = { inherit (nixpkgs) lib pkgs; config = commonConfig; nixpkgs = nixpkgs.outPath; }; };
        };      
      in [
        ({pkgs, home-manager, user, host, ... }: {
          imports = [
            # Core Packages
            ./modules/core.nix
    
            # Core Packages
            ./modules/gui/hyprland.nix
          ];
        })
      ] ++ (nixpkgs.lib.mapAttrsToList (name: value: import value.modulePath value.args) configModules);
    };
    
    # Hyprland Laptop - no extra toys
    nixosConfigurations.icarus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        user = "eriim";
        host = "icarus";
      } // attrs;        
      modules = let
        commonConfig = self.nixosConfigurations.icarus.config;

        configModules = {
          bluetooth = { modulePath = "${self}/modules/bluetooth.nix"; args = { inherit pkgs; config = commonConfig; }; };
          sound = { modulePath = "${self}/modules/sound.nix"; args = { inherit pkgs; config = commonConfig; }; };
          hardwareConfig = { modulePath = "${self}/hosts/icarus/hardware-configuration.nix"; args = { inherit (nixpkgs) lib pkgs; config = commonConfig; nixpkgs = nixpkgs.outPath; }; };
        };      
      in [
        ({pkgs, home-manager, user, host, ... }: {
          imports = [
    
            # Core Packages
            ./modules/core.nix
    
            # Core Packages
            ./modules/gui/hyprland.nix

          ];
        })
      ] ++ (nixpkgs.lib.mapAttrsToList (name: value: import value.modulePath value.args) configModules);
    };


    # Pentest-VM - minimal install - quick deployment
    nixosConfigurations.aeneas = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        user = "eriim";
        host = "datus";
      } // attrs;
      modules = let 
        config = self.nixosConfigurations.aeneas.config;

        configModules = {
          hardwareConfig = { modulePath = "${self}/hosts/aeneas/hardware-configuration.nix"; args = { inherit (nixpkgs) lib pkgs; config = config;  nixpkgs = nixpkgs.outPath; }; };
        };
        in [
          ({pkgs, home-manager, user, host, ... }: {
          imports = [
            # Pentest Specific files
            ./hosts/aeneas/home.nix
            
            ./modules/pentest

           ];
        })
      ] ++ (nixpkgs.lib.mapAttrsToList (name: value: import value.modulePath value.args) configModules);
    };
  };
}

