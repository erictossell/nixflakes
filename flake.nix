{
  description = "Eriim's machine specific configuration flake.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "";
    };

    hyprland = { url = "github:hyprwm/hyprland"; };

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

    NixOS-WSL = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@attrs:
    let
      supportedSystems = [ "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
    in {

      nixosConfigurations = {

        principium = let system = "x86_64-linux";
        in nixpkgs.lib.nixosSystem {
          specialArgs = {
            username = "eriim";
            hostName = "principium";
            hyprlandConfig = "desktop";
            inherit system;
          } // attrs;
          modules = [
            ./.
            ./modules/hardware/nvidia
            ./modules/apps/obs
            ./modules/steam
            ./modules/virt
          ];
        }; # principium

        live-image = let system = "x86_64-linux";
        in nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            username = "nixos";
            hostName = "live-image";
            hyprlandConfig = "laptop";
            inherit system;
          } // attrs;
          modules = [ ./minimal.nix ];
        }; # live-image

        winix = let system = "x86_64-linux";
        in nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            username = "eriim";
            hostName = "winix";
            inherit system;
          } // attrs;
          modules = [ ./wsl.nix ];
        }; # winix-wsl

        virtualis = let system = "x86_64-linux";
        in nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            username = "eriim";
            hostName = "virtualis";
            inherit system;
          } // attrs;
          modules = [ ./minimal.nix ];
        }; # virtualis

        terminus = let system = "x86_64-linux";
        in nixpkgs.lib.nixosSystem {
          specialArgs = {
            username = "eriim";
            hostName = "terminus";
            hyprlandConfig = "laptop";
            inherit system;
          } // attrs;
          modules = [ ./. ];
        }; # terminus
      }; # configurations

      devShells = forAllSystems (system:
        let pkgs = nixpkgsFor.${system};
        in {
          default =
            pkgs.mkShell { buildInputs = with pkgs; [ nixfmt statix ]; };
        });

      templates.default = {
        path = ./.;
        description = "The default template for Eriim's nixflakes.";
      }; # templates

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt;
    };
}
