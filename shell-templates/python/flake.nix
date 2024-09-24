# Template for a flake-controlled nix shell using python
# To use this:
#   1. Copy this file and put it in your project's directory
#   2. Run: `nix develop --impure` in your terminal
{
  description = "Python shell environment with Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    supportedSystems = [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" "aarch64-linux" ];
    forEachSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
      pkgs = import nixpkgs { inherit system; };
    });
  in
  {
    devShells = forEachSystem ({ pkgs }: {
      # NOTE: The python version can be set here, and also in UV_PYTHON variable
      default = pkgs.mkShell (let 
        python = pkgs.python312Full;
        pythonWithEnv = (python.withPackages (ps: [ ps.pydantic ]));
      in {
        venvDir = ".venv";
        packages = [
          python
          pythonWithEnv
          pkgs.uv
        ];
        #UV_PYTHON_PREFERENCE = "only-system";
        #UV_PYTHON = "${pkgs.python312Full}";

        shellHook = ''
          echo ${pkgs.python3}
          rm -rf .venv && echo " * Deleted previous .venv"
          uv venv -p ${pythonWithEnv} -v
          source .venv/bin/activate
          echo " * Active python $(which python3) resolves to $(realpath $(which python3))"
          echo " * All python versions:"
          which -a python3 | while read path; do echo "$path is $($path -V)"; done
        '';
      });
    });
  };
}