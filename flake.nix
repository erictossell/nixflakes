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
    
    # KDE-Plasma Desktop 
    nixosConfigurations.desktop-gnome = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        username = "eriim";
        hostname = "retis";
      } // attrs;        

      modules = let
        commonConfig = self.nixosConfigurations.desktop-gnome.config;

        configModules = {
          hardwareConfig = { modulePath = "${self}/hosts/retis"; args = { inherit (nixpkgs) lib pkgs; config = commonConfig; nixpkgs = nixpkgs.outPath; }; };
        };      

      in [
        ({pkgs, home-manager, username, hostname, ... }: {
          imports = [  
            # Core Packages
            ./modules/core
            # Desktop Environment
            ./modules/gui/gnome
            # Video game things
            ./modules/toys
            # Virtualisation
            ./modules/virt
          ];
        })
      ] ++ (nixpkgs.lib.mapAttrsToList (name: value: import value.modulePath value.args) configModules);
    };

    # KDE-Plasma Desktop 
    nixosConfigurations.desktop-plasma = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        username = "eriim";
        hostname = "retis";
      } // attrs;        

      modules = let
        commonConfig = self.nixosConfigurations.desktop-plasma.config;

        configModules = {
          hardwareConfig = { modulePath = "${self}/hosts/retis"; args = { inherit (nixpkgs) lib pkgs; config = commonConfig; nixpkgs = nixpkgs.outPath; }; };
        };      

      in [
        ({pkgs, home-manager, username, hostname, ... }: {
          imports = [  
            # Core Packages
            ./modules/core
            # Desktop Environment
            ./modules/gui/plasma
            # Video game things
            ./modules/toys
            # Virtualisation
            ./modules/virt
          ];
        })
      ] ++ (nixpkgs.lib.mapAttrsToList (name: value: import value.modulePath value.args) configModules);
    };

    # Hyprland Desktop - 3 monitors 
    nixosConfigurations.retis = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        username = "eriim";
        hostname = "retis";
      } // attrs;        

      modules = let
        commonConfig = self.nixosConfigurations.retis.config;

        configModules = {
          hardwareConfig = { modulePath = "${self}/hosts/retis"; args = { inherit (nixpkgs) lib pkgs; config = commonConfig; nixpkgs = nixpkgs.outPath; }; };
        };      
      
      in [
        ({pkgs, home-manager, hyprland, username, hostname, ... }: {
          imports = [
            # Core Packages
            ./modules/core
            # Window Manager
            ./modules/gui/hyprland/nvidia
            # Video game things
            ./modules/toys
            # Virtualisation
            ./modules/virt
          ];
        })
      ] ++ (nixpkgs.lib.mapAttrsToList (name: value: import value.modulePath value.args) configModules);
    };

    # Hyprland Laptop - no extra toys
    nixosConfigurations.sisyphus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        username = "eriim";
        hostname = "sisyphus";
      } // attrs;        

      modules = let
        commonConfig = self.nixosConfigurations.sisyphus .config;

        configModules = {
          hardwareConfig = { modulePath = "${self}/hosts/sisyphus"; args = { inherit (nixpkgs) lib pkgs; config = commonConfig; nixpkgs = nixpkgs.outPath; }; };
        };  

      in [
        ({pkgs, home-manager, username, hostname, ... }: {
          imports = [
            # Core Packages
            ./modules/core
            # Window Manager
            ./modules/gui/hyprland/standard
          ];
        })
      ] ++ (nixpkgs.lib.mapAttrsToList (name: value: import value.modulePath value.args) configModules);
    };
    
    # Hyprland Laptop - no extra toys
    nixosConfigurations.icarus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        username = "eriim";
        hostname = "icarus";
      } // attrs;        
      
      modules = let
        commonConfig = self.nixosConfigurations.icarus.config;

        configModules = {
          hardwareConfig = { modulePath = "${self}/hosts/icarus"; args = { inherit (nixpkgs) lib pkgs; config = commonConfig; nixpkgs = nixpkgs.outPath; }; };
        };      
      
      in [
        ({pkgs, home-manager, username, hostname, ... }: {
          imports = [
            # Core Packages
            ./modules/core
            # Window Manager
            ./modules/gui/hyprland/standard
          ];
        })
      ] ++ (nixpkgs.lib.mapAttrsToList (name: value: import value.modulePath value.args) configModules);
    };


    # Pentest-VM - minimal install - quick deployment
    nixosConfigurations.aeneas = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        username = "eriim";
        hostname = "aeneas";
      } // attrs;

      modules = let 
        config = self.nixosConfigurations.aeneas.config;
        configModules = {
          hardwareConfig = { modulePath = "${self}/hosts/aeneas"; args = { inherit (nixpkgs) lib pkgs; config = config;  nixpkgs = nixpkgs.outPath; }; };
        };
      
        in [
          ({pkgs, home-manager, username, hostname, ... }: {
          imports = [
            # Pentest Specific files
            ./hosts/aeneas/home    
            ./modules/pentest
           ];
        })
      ] ++ (nixpkgs.lib.mapAttrsToList (name: value: import value.modulePath value.args) configModules);
    };
  };
}

