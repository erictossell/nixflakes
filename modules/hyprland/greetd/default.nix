{ pkgs, username, ... }: {
  services.greetd = {
    enable = true;
    restart = false;
    settings = {
      default_session = {
        command =
          "${pkgs.greetd.tuigreet}/bin/tuigreet --time --greeting 'Welcome to Wonderland' --asterisks --cmd Hyprland";
        user = username;
      };
    };
  };
}
