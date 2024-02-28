{ eriixpkgs, system, ... }: {
  environment.variables.EDITOR = "nvim";
  environment.systemPackages = [ eriixpkgs.packages.${system}.eriixvim ];
}
