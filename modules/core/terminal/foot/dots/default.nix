{ home-manager, username, ... }:
{
  home-manager.users.${username} =  { ... }: {
    home.file = {
      ".config/foot/foot.ini".text = ''
font=M+1Code Nerd Font:size=13
pad=10x10

[colors]
alpha=0.2
background=3b0ec4
      '';     
    };
  };
}