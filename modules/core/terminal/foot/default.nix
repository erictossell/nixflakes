{ pkgs, username, ... }:
{
  environment.systemPackages = with pkgs; [ foot ];

  home-manager.users.${username} = _: {
    home.file = {
      ".config/foot/foot.ini".text = ''
                font=Jetbrains Mono:size=13
                pad=15x15

                [colors]
        	alpha=0.5
                background=232136
      '';
    };
  };
}
