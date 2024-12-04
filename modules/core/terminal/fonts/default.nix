{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      jetbrains-mono
      monaspace
      nerd-fonts.mplus
      noto-fonts
      noto-fonts-cjk-sans
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
