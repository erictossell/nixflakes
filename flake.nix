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
    nixosConfigurations.desktop-gnome = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        user = "eriim";
        host = "nixop";
      } // attrs;     
      modules = let
        commonConfig = self.nixosConfigurations.desktop-gnome.config;

        configModules = {
          nvidia = { modulePath = "${self}/modules/nvidia.nix"; args = { inherit pkgs; config = commonConfig; }; };
          bluetooth = { modulePath = "${self}/modules/bluetooth.nix"; args = { inherit pkgs; config = commonConfig; }; };
          sound = { modulePath = "${self}/modules/sound.nix"; args = { inherit pkgs; config = commonConfig; }; };
          hardwareConfig = { modulePath = "${self}/hosts/desktop/hardware-configuration.nix"; args = { inherit (nixpkgs) lib pkgs; config = commonConfig; nixpkgs = nixpkgs.outPath; }; };
        };      
      in [
        ({pkgs, home-manager, user, host, ... }: {
          imports = [
            # Desktop Specific files
            ./hosts/desktop/home.nix
    
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
    nixosConfigurations.desktop-plasma = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        user = "eriim";
        host = "nixop";
      } // attrs;        
      modules = let
        commonConfig = self.nixosConfigurations.desktop-plasma.config;

        configModules = {
          nvidia = { modulePath = "${self}/modules/nvidia.nix"; args = { inherit pkgs; config = commonConfig; }; };
          bluetooth = { modulePath = "${self}/modules/bluetooth.nix"; args = { inherit pkgs; config = commonConfig; }; };
          sound = { modulePath = "${self}/modules/sound.nix"; args = { inherit pkgs; config = commonConfig; }; };
          hardwareConfig = { modulePath = "${self}/hosts/desktop/hardware-configuration.nix"; args = { inherit (nixpkgs) lib pkgs; config = commonConfig; nixpkgs = nixpkgs.outPath; }; };
        };      
      in [
        ({pkgs, home-manager, user, host, ... }: {
          imports = [
            # Desktop Specific files
            ./hosts/desktop/home.nix
    
            # Chromium Firefox Nyxt
            ./modules/browsers.nix
    
            # Core Packages
            ./modules/core.nix
    
            # Core Packages
            ./modules/plasma.nix

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
    nixosConfigurations.desktop-hyprland = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        user = "eriim";
        host = "nixop";
      } // attrs;        
      modules = let
        commonConfig = self.nixosConfigurations.desktop-hyprland.config;

        configModules = {
          nvidia = { modulePath = "${self}/modules/nvidia.nix"; args = { inherit pkgs; config = commonConfig; }; };
          bluetooth = { modulePath = "${self}/modules/bluetooth.nix"; args = { inherit pkgs; config = commonConfig; }; };
          sound = { modulePath = "${self}/modules/sound.nix"; args = { inherit pkgs; config = commonConfig; }; };
          hardwareConfig = { modulePath = "${self}/hosts/desktop/hardware-configuration.nix"; args = { inherit (nixpkgs) lib pkgs; config = commonConfig; nixpkgs = nixpkgs.outPath; }; };
        };      
      in [
        ({pkgs, home-manager, hyprland, user, host, ... }: {
          imports = [
            # Desktop Specific files
            ./hosts/desktop/home.nix
    
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

    nixosConfigurations.laptop-hyprland = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        user = "eriim";
        host = "nixop1";
      } // attrs;        
      modules = let
        commonConfig = self.nixosConfigurations.laptop-hyprland.config;

        configModules = {
          bluetooth = { modulePath = "${self}/modules/bluetooth.nix"; args = { inherit pkgs; config = commonConfig; }; };
          sound = { modulePath = "${self}/modules/sound.nix"; args = { inherit pkgs; config = commonConfig; }; };
          hardwareConfig = { modulePath = "${self}/hosts/laptop/hardware-configuration.nix"; args = { inherit (nixpkgs) lib pkgs; config = commonConfig; nixpkgs = nixpkgs.outPath; }; };
        };      
      in [
        ({pkgs, home-manager, user, host, ... }: {
          imports = [
            # Desktop Specific files
            ./hosts/laptop/home.nix
    
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

    nixosConfigurations.pentest-vm = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        user = "nil";
        host = "nilbox";
      } // attrs;
      modules = let 
        config = self.nixosConfigurations.pentest-vm.config;

        configModules = {
          hardwareConfig = { modulePath = "${self}/hosts/pentest-vm/hardware-configuration.nix"; args = { inherit (nixpkgs) lib pkgs; config = config;  nixpkgs = nixpkgs.outPath; }; };
        };
        in [
          ({pkgs, home-manager, user, host, ... }: {
          imports = [
            # Pentest Specific files
            ./hosts/pentest-vm/home.nix
            
            ./modules/pentest

           ];
        })
      ] ++ (nixpkgs.lib.mapAttrsToList (name: value: import value.modulePath value.args) configModules);
    };
  };
}

