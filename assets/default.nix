{ home-manager, username, ... }:
{
  home-manager.users.${username} =  { ... }: {
    home.file = {
      ".config/backgrounds".source = ./backgrounds;
    };
  };
}
