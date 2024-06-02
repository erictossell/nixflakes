{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      monaspace
      nerdfonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      roboto
    ];
    fontconfig.defaultFonts = {
      serif = [
        "Monaspace Radon"
        "Noto Color Emoji"
      ];
      sansSerif = [
        "Monaspace Xenon"
        "Noto Color Emoji"
      ];
      monospace = [
        "Monaspace Neon"
      ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}

