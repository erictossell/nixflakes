# { hostName, config, pkgs, ... }:

# let
#   defaultPkgs = with pkgs; [
#     htop
#     git
#     rustc
#     cargo
#     # Add more packages here
#   ];
# in {
#   imports = [
#     ./${hostName}
#     ./internationalisation
#   ];

#   environment.systemPackages = with pkgs; [
#     # Include the default packages
#     ] ++ defaultPkgs;
# }

{ hostName, ... }:
{
  imports = [
    ./${hostName}
    ./internationalisation
  ];
}