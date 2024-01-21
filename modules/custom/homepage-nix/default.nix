{ homepage-nix, system, username, ... }:
{
  imports = [
    homepage-nix.nixosModules.${system}.default
  ];

  services.homepage-rs = {
    enable = true;
    port = 8080;
    staticDir = "/home/${username}/repos/misc/homepage-rs/static";
  };
}
