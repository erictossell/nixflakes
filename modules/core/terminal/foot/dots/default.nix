{ home-manager, username, ... }:
{
  home-manager.users.${username} =  { ... }: {
    home.file = {
      ".config/foot/foot.ini".text = ''
font=M+1Code Nerd Font:size=13
pad=15x15

[colors]
background=232136
'';     
    };
  };
}
