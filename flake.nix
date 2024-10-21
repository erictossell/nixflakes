{
  description = "topher's machine specific configuration flake.";

  inputs = {
    #nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "";
    };

    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    };

    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    eriixpkgs = {
      url = "github:erictossell/eriixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tophpkgs = {
      url = "github:topher097/tophpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    NixOS-WSL = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Env file system
    envfs = {
      url = "github:Mic92/envfs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Weekly updated nix-index database.
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix User Repository
    nur = {
      url = "github:nix-community/NUR";
    };

    # Firefox style
    penguin-fox = {
      url = github:p3nguin-kun/penguinFox;
      flake = false;
    };
  };

  outputs =
    {
      self,
      tophpkgs,
      nixpkgs,
      envfs,
      home-manager,
      nur,
      ...
    } @ attrs:
    let
      inherit (self) outputs;
      supportedSystems = [ "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      nixpkgsFor = forAllSystems (system: import nixpkgs { 
        inherit system; 
        config = {
          allowUnfree = true;
        }; 
      });
    in
    {
      # Your custom packages
      # Accessible through 'nix build', 'nix shell', etc
      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});

      # Your custom packages and modifications, exported as overlays
      overlays = import ./overlays { inherit attrs; };

      nixosConfigurations = {

        pgi-desktop =
          let
            system = "x86_64-linux";
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              username = "topher";
              hostName = "pgi-desktop";
              hyprlandConfig = "desktop";
              DE = "gnome";
              inherit system outputs attrs;
            } // attrs;
            modules = [
              ./.
              ./modules/apps/ms-teams     # teams-for-linux
              #./modules/hardware/nvidia   # Nvidia hardware
              ./modules/virt              # Virtualization tools
            ];
          }; # pgi-desktop 


        topher-laptop =
          let
            system = "x86_64-linux";
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              username = "topher";
              hostName = "topher-laptop";
              hyprlandConfig = "laptop";
              DE = "gnome";
              inherit system outputs attrs;
            } // attrs;
            modules = [
              ./.
              ./modules/hardware/nvidia   # Nvidia hardware
              ./modules/virt              # Virtualization tools
            ];
          }; # topher-laptop

        live-image =
          let
            system = "x86_64-linux";
          in
          nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = {
              username = "nixos";
              hostName = "live-image";
              hyprlandConfig = "laptop";
              inherit system outputs attrs;
            } // attrs;
            modules = [ ./minimal.nix ];
          }; # live-image

        winix =
          let
            system = "x86_64-linux";
          in
          nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = {
              username = "topher";
              hostName = "winix";
              inherit system outputs attrs;
            } // attrs;
            modules = [ ./wsl.nix ];
          }; # winix

        # vm-temp =
        #   let
        #     system = "x86_64-linux";
        #   in
        #   nixpkgs.lib.nixosSystem {
        #     inherit system;
        #     specialArgs = {
        #       username = "topher";
        #       hostName = "vm-temp";
        #       inherit system outputs inputs;
        #     } // inputs;
        #     modules = [ ./minimal.nix ];
        #   }; # vm-temp

        # # Appended new system
        # virtualis =
        #   let
        #     system = "x86_64-linux";
        #   in
        #   nixpkgs.lib.nixosSystem {
        #     specialArgs = {
        #       username = "topher";
        #       DE = "sway";
        #       hostName = "virtualis";
        #       inherit system outputs attrs;
        #     } // attrs;
        #     modules = [
        #       ./.
        #       ./modules/ssh
        #     ];
        #   }; # virtualis
      };

      # All systems/hosts get these packages installed
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgsFor.${system};
        in
        {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              nixfmt
              statix
              tophvim.nixosModules.${system}.default
            ];
          };
        }
      );

      templates.default = {
        path = ./.;
        description = "The default template for topher's nixflakes.";
      }; # templates

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
    };
}
