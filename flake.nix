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

    NixOS-WSL = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@attrs:
    let
      supportedSystems = [ "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
    in
    {

      nixosConfigurations = {

        arkhitekton =
          let
            system = "x86_64-linux";
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              DE = "hyprland";
              username = "eriim";
              hostName = "arkhitekton";
              hyprlandConfig = "desktop";
              inherit system;
            } // attrs;
            modules = [
              ./.
              ./modules/hardware/nvidia
              ./modules/steam
              ./modules/virt
            ];
          }; # arkhitekton

        terminus =
          let
            system = "x86_64-linux";
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              username = "eriim";
              hostName = "terminus";
              hyprlandConfig = "laptop";
              DE = "hyprland";
              inherit system;
            } // attrs;
            modules = [
              ./.
              ./modules/virt/podman.nix
            ];
          }; # terminus

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
              inherit system;
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
              username = "eriim";
              hostName = "winix";
              inherit system;
            } // attrs;
            modules = [ ./wsl.nix ];
          }; # winix

        vm-temp =
          let
            system = "x86_64-linux";
          in
          nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = {
              username = "eriim";
              hostName = "vm-temp";
              inherit system;
            } // attrs;
            modules = [ ./minimal.nix ];
          }; # vm-temp

# Appended new system
	virtualis =
       	let system = "x86_64-linux";
	in nixpkgs.lib.nixosSystem {
          specialArgs = {
            username = "eriim";
	    DE = "xfce";
            hostName = "virtualis";
	    inherit system;
          } // attrs;        
          modules = [
            ./.
	    ./modules/ssh
          ];
        }; # virtualis
      }; # configurations

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
            ];
          };
        }
      );

      templates.default = {
        path = ./.;
        description = "The default template for Eriim's nixflakes.";
      }; # templates

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
    };
}
