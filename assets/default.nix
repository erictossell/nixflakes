{ home-manager, username, ... }: {
  home-manager.users.${username} = _: {
    home.file = { ".config/backgrounds".source = ./backgrounds; };
  };
}
