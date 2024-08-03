{ stylix, pkgs, ... }:
{
  imports = [ stylix.nixosModules.stylix ];
  stylix = {
    enable = true;
    image = ../../assets/backgrounds/aperture-orange-blue.jpg;
    polarity = "dark";

    fonts = {
      serif = {
        package = pkgs.ibm-plex;
        name = "IBM Plex Serif";
      };

      sansSerif = {
        package = pkgs.ibm-plex;
        name = "IBM Plex Sans";
      };

      monospace = {
        package = pkgs.ibm-plex;
        name = "IBM Plex Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };

}
