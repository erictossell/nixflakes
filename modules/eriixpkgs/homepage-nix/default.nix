{ eriixpkgs, system, username, ... }: {
  imports = [ eriixpkgs.nixosModules.${system}.homepage-nix ];

  services.homepage-nix = {
    enable = true;
    port = 8080;
    staticDir = "/home/${username}/repos/misc/homepage";
  };
}
