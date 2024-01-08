{ stdenv, lib, pkgs }:

stdenv.mkDerivation rec {
  pname = "M+1CodeNerdFont";
  version = "1.0";

  src = ./M+1CodeNerdFont.ttf;

  dontUnpack = true; # Skip the unpacking phase

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    cp ${src} $out/share/fonts/truetype/
  '';

  meta = with lib; {
    description = "Custom font";
    license = licenses.free;
  };
}

