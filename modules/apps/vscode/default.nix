{
  pkgs,
  home-manager,
  username,
  lib,
  ...
}:
{
  home-manager.users.${username} = {
    # VS Code on Wayland has issues, make sure to set the title bar to custom
    # https://github.com/microsoft/vscode/issues/181533
    programs.vscode = {
      enable = true;
      enableUpdateCheck = true;
      enableExtensionUpdateCheck = true;
      extensions = with pkgs.vscode-extensions; [
        golang.go
        #vscodevim.vim
        github.copilot
        #github.github-vscode-theme
        #github.vscode-github-actions
        ms-python.python
        #ms-vscode.powershell
        bbenoist.nix
      ];
      userSettings = {
        "window.titleBarStyle" = "custom";
        "workbench.colorTheme" = lib.mkForce "Dark+ Modern";
        #"editor.fontFamily" = "'M+1Code Nerd Font','Droid Sans Mono', 'monospace'";
        "github.copilot.enable" = {
          "*" = true;
          "plaintext" = false;
          "markdown" = true;
          "scminput" = false;
        };
        #"powershell.powerShellAdditionalExePaths" = "/run/current-system/sw/bin/pwsh";
        "files.exclude" = {
          "**/.trunk/*actions/" = true;
          "**/.trunk/*logs/" = true;
          "**/.trunk/*notifications/" = true;
          "**/.trunk/*out/" = true;
          "**/.trunk/*plugins/" = true;
        };
        "files.watcherExclude" = {
          "**/.trunk/*actions/" = true;
          "**/.trunk/*logs/" = true;
          "**/.trunk/*notifications/" = true;
          "**/.trunk/*out/" = true;
          "**/.trunk/*plugins/" = true;
        };
      };
    };
  };
}