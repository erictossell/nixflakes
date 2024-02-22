{ pkgs, username, ... }:
{
  # Required to run Windows applications ie World of Warcraft
  #users.users.${username} = {
  #  packages = with pkgs; [ 
  #    (wineWowPackages.full.override {
  #      wineRelease = "staging";
  #      mingwSupport = true;
  #     })
  #    winetricks
  #  ];
  #};

  #environment.systemPackages = with pkgs; [ lutris ];

  # This can optionally be installed via flatpack. 
  # Proton Experimental is pretty sweet
  programs = {
    steam.enable = true;
  };
}
