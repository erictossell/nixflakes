{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      jetbrains-mono
      monaspace
      nerdfonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      roboto
    ];
    fontconfig.defaultFonts = {
      serif = [
        "Georgia"
        "Noto Color Emoji"
      ];
      sansSerif = [
        "Roboto"
        "Noto Color Emoji"
      ];
      monospace = [ "Monaspace Neon" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
