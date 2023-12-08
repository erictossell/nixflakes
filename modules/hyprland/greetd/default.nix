{ pkgs, username, ... }:
{
  services.greetd = {
    enable = true;
    restart = false;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --greeting 'Welcome to Wonderland, ${username}' --asterisks --cmd Hyprland";
        user = username;
      };
    };
  };
}
