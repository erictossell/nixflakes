{ pkgs, home-manager, username, ... }:
{
  environment.systemPackages = with pkgs; [ mako ];
  home-manager.users.${username} = {
    home.file = {
      ".config/mako/config".text = ''
        font=M+1Code Nerd Font
        format=<b>%a ⏵</b> %s\n%b
        sort=-time
        output=DP-2
        layer=overlay
        anchor=top-center
        background-color=#221A3B
        width=300
        height=110
        margin=5
        padding=0,5,10
        border-size=2
        border-color=#08995A
        border-radius=15
        icons=0
        max-icon-size=64
        default-timeout=5000
        ignore-timeout=1

        [urgency=normal]
        border-color=#2797BE

        [urgency=high]
        border-color=#D82A57
        default-timeout=0
      '';
    };
  };
}
