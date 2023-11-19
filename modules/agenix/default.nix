{ agenix, ... }:
{
  imports = [
    agenix.nixosModules.default
  ];
  environment.systemPackages = [ agenix.packages.x86_64-linux.default ];
}
