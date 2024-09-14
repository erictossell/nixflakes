{
  pkgs,
  username,
  home-manager,
  ...
}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    shell = pkgs.fish;
    isNormalUser = true;
    initialPassword = "temp123";
    extraGroups = [
      "wheel"   # For sudo
      "input"
      "video"   # nvidia driver with video enabled
      "render"  # nvidia driver with rendering enabled
      "compute" # nvidia driver with compute enabled
    ];
  };

  # Setup global git config for user
  home-manager.users.${username}.programs.git = {
    package = pkgs.gitAndTools.gitFull;
    userName = "topher097";
    userEmail = "cmendres400@gmail.com";
    aliases = {   # prepend these commands with "git"
      undo = "reset HEAD~1 --mixed";
      prv = "!gh pr view";
      prc = "!gh pr create";
      prs = "!gh pr status";
      prm = "!gh pr merge -d";
    };
    extraConfig = {
      credential.helper = "oauth";
      color = {
        ui = "auto";
      };
      diff = {
        tool = "vimdiff";
        mnemonicprefix = true;
      };
      merge = {
        tool = "splice";
      };
      push = {
        default = "simple";
      };
      pull = {
        rebase = true;
      };
      branch = {
        autosetupmerge = true;
      };
      rerere = {
        enabled = true;
      };
      # include = {
      #   path = "~/.gitconfig.local";
      # };
    };
  };
}
