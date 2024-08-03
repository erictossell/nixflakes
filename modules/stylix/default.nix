{ stylix, pkgs, ... }:
{
  imports = [
    stylix.nixosModules.stylix
  ];
  stylix = {
    enable = true;
    image = ../../assets/backgrounds/porthole.jpg;
    polarity = "dark";

    fonts = {
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };

    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };

    monospace = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans Mono";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };
  };

  
}
