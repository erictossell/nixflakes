{
  description = "Machine specific configuration flake.";

  # Defining package channels
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    hyprland = {
      url = "github:hyprwm/hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  # Defining flake import structure for packages
  outputs = { self, nixpkgs, home-manager, hyprland, ... }@attrs: 
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in 
  { 
    # Hyprland Desktop - 3 monitors 
    nixosConfigurations.retis = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        username = "eriim";
        hostname = "retis";
      } // attrs;        
      modules = let
        config = self.nixosConfigurations.retis.config;
        configModules = {
          hardwareConfig = { modulePath = "${self}/hosts/retis"; args = { inherit (nixpkgs) lib pkgs; config = config; nixpkgs = nixpkgs.outPath; }; };
        };      
      in [
        ({pkgs, home-manager, hyprland, username, hostname, ... }: {
          imports = [
            ./modules/core
            ./modules/gui/hyprland/nvidia
            ./modules/obs
            ./modules/toys
            ./modules/virt
            ./profiles/smb_client
          ];
        })
      ] ++ (nixpkgs.lib.mapAttrsToList (name: value: import value.modulePath value.args) configModules);
    };#retis

    # Hyprland Laptop - no extra toys
    nixosConfigurations.sisyphus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        username = "eriim";
        hostname = "sisyphus";
      } // attrs;        
      modules = let
        config = self.nixosConfigurations.sisyphus .config;
        configModules = {
          hardwareConfig = { modulePath = "${self}/hosts/sisyphus"; args = { inherit (nixpkgs) lib pkgs; config = config; nixpkgs = nixpkgs.outPath; }; };
        };  
      in [
        ({pkgs, home-manager, username, hostname, ... }: {
          imports = [
            ./modules/core
            ./modules/gui/hyprland/standard
            ./profiles/smb_client
          ];
        })
      ] ++ (nixpkgs.lib.mapAttrsToList (name: value: import value.modulePath value.args) configModules);
    };#sisyphus
    
    # Hyprland Laptop - 1 monitor/no toys
    nixosConfigurations.icarus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        username = "eriim";
        hostname = "icarus";
      } // attrs;        
      modules = let
        config = self.nixosConfigurations.icarus.config;
        configModules = {
          hardwareConfig = { modulePath = "${self}/hosts/icarus"; args = { inherit (nixpkgs) lib pkgs; config = config; nixpkgs = nixpkgs.outPath; }; };
        };      
      in [
        ({pkgs, home-manager, username, hostname, ... }: {
          imports = [
            ./modules/core
            ./modules/gui/hyprland/standard
            ./profiles/smb_client
          ];
        })
      ] ++ (nixpkgs.lib.mapAttrsToList (name: value: import value.modulePath value.args) configModules);
    };#icarus

    # Pentest-VM 
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
            ./modules/pentest
           ];
        })
      ] ++ (nixpkgs.lib.mapAttrsToList (name: value: import value.modulePath value.args) configModules);
    };#aeneas

    # Gnome Desktop 
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
            ./modules/core
            ./modules/gui/gnome
            ./modules/toys
            ./modules/virt
          ];
        })
      ] ++ (nixpkgs.lib.mapAttrsToList (name: value: import value.modulePath value.args) configModules);
    };# Gnome Desktop

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
            ./modules/core
            ./modules/gui/plasma
            ./modules/toys
            ./modules/virt
          ];
        })
      ] ++ (nixpkgs.lib.mapAttrsToList (name: value: import value.modulePath value.args) configModules);
    }; #KDE-Plasma Desktop

  };
}

