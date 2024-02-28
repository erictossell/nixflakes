{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    libreoffice-qt
    hunspell
    hunspellDicts.en_CA
    hunspellDicts.en_US
  ];
}
