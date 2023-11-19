{ pkgs, home-manager, username, ... }:
{
    home-manager.users.${username} = { pkgs, ... }: {
    # VS Code on Wayland has issues, make sure to set the title bar to custom
    # https://github.com/microsoft/vscode/issues/181533
    programs.vscode = {
      enable = true;
      enableUpdateCheck = true;
      enableExtensionUpdateCheck = true;
      extensions = with pkgs.vscode-extensions; [
        golang.go
        vscodevim.vim
        #github.copilot
        github.github-vscode-theme
        github.vscode-github-actions
        #ms-python.python
        ms-vscode.powershell
        bbenoist.nix
      ];
      userSettings = {
         "window.titleBarStyle" = "custom";
         "workbench.colorTheme" = "Github Dark Colorblind (Beta)";
         "editor.fontFamily" = "'M+1Code Nerd Font','Droid Sans Mono', 'monospace', monospace";
         #"github.copilot.enable" = {
         #  "*" = true;
         #  "plaintext" = false;
         #  "markdown" = true;
         #  "scminput" = false;
         #};
         "powershell.powerShellAdditionalExePaths" = "/run/current-system/sw/bin/pwsh";
      };
    };
  };
}
