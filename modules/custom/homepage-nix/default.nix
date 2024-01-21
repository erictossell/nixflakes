{ homepage-nix, system, username, ... }:
{
  imports = [
    homepage-nix.nixosModules.${system}.default
  ];

  services.homepage-nix = {
    enable = true;
    port = 8080;
    staticDir = "/home/${username}/repos/nix/homepage-nix/static";
  };
}
