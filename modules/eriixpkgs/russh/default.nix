{ eriixpkgs, system, ... }: {
  environment.systemPackages = [ eriixpkgs.packages.${system}.russh ];
}
