{
  description = "topher's machine specific configuration flake.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

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

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    envfs = {
      url = "github:Mic92/envfs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      envfs,
      ...
    } @ attrs:
    let
      inherit (self) outputs;
      supportedSystems = [ "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
    in
    {
      # Your custom packages
      # Accessible through 'nix build', 'nix shell', etc
      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});

      # Your custom packages and modifications, exported as overlays
      overlays = import ./overlays {inherit attrs;};

      nixosConfigurations = {

        # topher-pc =
        #   let
        #     system = "x86_64-linux";
        #   in
        #   nixpkgs.lib.nixosSystem {
        #     specialArgs = {
        #       DE = "hyprland";
        #       username = "topher";
        #       hostName = "topher-pc";
        #       hyprlandConfig = "desktop";
        #       inherit system;
        #     } // attrs;
        #     modules = [
        #       ./.
        #       ./modules/hardware/nvidia   # Nvidia hardware
        #       ./modules/apps/vscode       # VSCode flake
        #       ./modules/virt              # Virtualization tools
        #     ];
        #   }; # topher-pc

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

        vm-temp =
          let
            system = "x86_64-linux";
          in
          nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = {
              username = "topher";
              hostName = "vm-temp";
              inherit system outputs attrs;
            } // attrs;
            modules = [ ./minimal.nix ];
          }; # vm-temp

        # Appended new system
        virtualis =
          let
            system = "x86_64-linux";
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              username = "topher";
              DE = "sway";
              hostName = "virtualis";
              inherit system outputs attrs;
            } // attrs;
            modules = [
              ./.
              ./modules/ssh
            ];
          }; # virtualis
      };

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
        description = "The default template for topher's nixflakes.";
      }; # templates

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
    };
}
