{
  pkgs ? import <nixpkgs> { },
}:

pkgs.stdenv.mkDerivation {
  name = "clean";
  version = "1.0";

  src = ./clean.sh;

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/clean
    chmod +x $out/bin/clean
  '';
}
