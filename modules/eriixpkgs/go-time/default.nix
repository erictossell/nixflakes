{ pkgs, eriixpkgs, ... }: {
  environment.systemPackages = with pkgs;
    [ eriixpkgs.packages.${system}.go-time ];
}
