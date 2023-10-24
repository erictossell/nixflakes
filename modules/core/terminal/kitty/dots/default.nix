{ home-manager, username, ... }:
{
  home-manager.users.${username} =  { ... }: {
    home.file = {
      ".config/kitty/kitty.conf".text = ''
background #2a1b75
background_opacity 0.8
      '';     
    };
  };
}