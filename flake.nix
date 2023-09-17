{
  description = "My desktop flake.";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";

  };
  outputs = { self, nixpkgs, ... }@attrs: {
    nixosConfigurations.erix = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
      ./configuration.nix
      ./home.nix
      ];    
    };
  };
}
