{ pkgs, home-manager, username, ... }: {
  #----- Home Manager Config -----
  home-manager.users.${username} = {

    home.sessionVariables = { MOZ_ENABLE_WAYLAND = 1; };

    programs = {
      #chromium = {
      #  enable = true;
      #};
      firefox = {
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
  };

  #----- System Configuration -----
  #programs = {
  #  chromium = {
  #    enable = true;
  #    extraOpts = {
  #      "BrowserSignin" = 1;
  #      "SyncDisabled" = false;
  #      "PasswordManagerEnabled" = false;
  #      "SpellcheckEnabled" = true;
  #      "SpellcheckLanguage" = [ "en-US" ];
  #    };
  #    extensions = [
  #      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
  #      #"aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1password
  #    ];
  #  };
  #};
}
