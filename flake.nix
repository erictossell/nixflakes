{
  description = "My desktop flake.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager, ... }@attrs: 
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in 
  {
    nixosConfigurations.erix = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
     
      modules = [ 
        (import ./hardware-configuration.nix {
          inherit (nixpkgs) lib;
          config = self.nixosConfigurations.erix.config;
          nixpkgs = nixpkgs.outPath;
        })
        (import ./configuration.nix { inherit pkgs; }) 
        (import ./home.nix { inherit pkgs home-manager; })
        (import ./font.nix { inherit pkgs;})
        (import ./modules/fish.nix { inherit pkgs;})
       # (import ./modules/gnome-home.nix { inherit pkgs home-manager;})
        (import ./modules/starship.nix { inherit pkgs;})
        (import ./modules/virt.nix { inherit pkgs;})
      ];
    };
  };
}

