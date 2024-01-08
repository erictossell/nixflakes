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

    hyprland = {
      url = "github:hyprwm/hyprland";
    };

    eriixvim = {
      url = "github:erictossell/eriixvim";
    };

    russh = {
      url = "github:erictossell/russh";
    };

    NixOS-WSL = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... } @ attrs:
    let
      supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];

      # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      # Nixpkgs instantiated for supported system types.
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
    in
    {

      nixosConfigurations = {

        principium =
          let system = "x86_64-linux";
          in nixpkgs.lib.nixosSystem {
            specialArgs = {
              username = "eriim";
              hostname = "principium";
              hyprlandConfig = "desktop";
              inherit system;
            } // attrs;
            modules = [
              ./.
              ./modules/hardware/nvidia
              ./modules/apps/obs
              ./modules/toys
              ./modules/virt
              ./modules/russh
            ];
          }; #principium

        sisyphus =
          let system = "x86_64-linux";
          in nixpkgs.lib.nixosSystem {
            specialArgs = {
              username = "eriim";
              hostname = "sisyphus";
              hyprlandConfig = "laptop";
              inherit system;
            } // attrs;
            modules = [
              ./.
              ./modules/russh
            ];
          }; #sisyphus

        live-image =
          let system = "x86_64-linux";
          in nixpkgs.lib.nixosSystem {
            system = system;
            specialArgs = {
              username = "nixos";
              hostname = "live-image";
              hyprlandConfig = "laptop";
              inherit system;
            } // attrs;
            modules = [
              ./minimal.nix
            ];
          }; #live-image

        winix =
          let system = "x86_64-linux";
          in nixpkgs.lib.nixosSystem {
            system = system;
            specialArgs = {
              username = "eriim";
              hostname = "winix";
              inherit system;
            } // attrs;
            modules = [
              ./wsl.nix
            ];
          }; #winix-wsl

      }; #configurations

      devShells = forAllSystems (system:
        let
          pkgs = nixpkgsFor.${system};
        in
        {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [ statix  ];
          };
        });

      templates.default = {
        path = ./.;
        description = "The default template for Eriim's nixflakes.";
      }; #templates

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    };
}
