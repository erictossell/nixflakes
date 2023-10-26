{ pkgs, username, ... }:
{
  services.greetd = {
    enable = true;
    restart = false;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = username;
      };
      initial_session = {
        command = "Hyprland";
        user = username;
      };
    };
  };
}
