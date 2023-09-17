{
  description = "My desktop flake.";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };
  outputs = { self, nixpkgs, ... }@attrs: 
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in 
  {
    nixosConfigurations.erix = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
      ({ pkgs, ... }: import ./configuration.nix)
      ({ pkgs, ... }: import ./home.nix)
      ];    
    };
  };
}
