{
  description = "Machine specific configuration flake.";
  # Defining package channels
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/hyprland";
    };

  };
  
  # Defining flake import structure for packages
  outputs = { self, nixpkgs, ... } @ attrs: { 
    
    # Hyprland Desktop - 3 monitors 
    nixosConfigurations.retis = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        username = "eriim";
        hostname = "retis";
        displayConfig = "desktop";
        nvidia_bool = "enabled";
      } // attrs;        
      modules = [
            ./.
            ./modules/obs
            ./modules/toys
            ./modules/virt
          ];
    };#retis

    # Hyprland Laptop 
    nixosConfigurations.sisyphus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        username = "eriim";
        hostname = "sisyphus";
        displayConfig = "laptop";
        nvidia_bool = "disabled";
      } // attrs;        
      modules = [
            ./.
          ];
    };#sisyphus

  };
}
