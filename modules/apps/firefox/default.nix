{ username, ... }:
{
  #----- Home Manager Config -----
  home-manager.users.${username} = {

    home.sessionVariables = {
      MOZ_ENABLE_WAYLAND = 0;
    };

    programs.firefox = {
      enable = true;
      profiles = {
        ${username} = {
          isDefault = true;
          settings = {
            "browser.startup.homepage" = "http://localhost:8080";
          };
        };
      };
    };
  };
}
