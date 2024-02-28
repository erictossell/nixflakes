{ home-manager, username, ... }: {
  home-manager.users.${username} = _: {
    home.file = {
      ".config/foot/foot.ini".text = ''
                font=M+1Code Nerd Font:size=13
                pad=15x15

                [colors]
        	alpha=0.8
                background=232136
      '';
    };
  };
}
