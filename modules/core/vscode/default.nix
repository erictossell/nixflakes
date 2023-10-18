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
        github.copilot
        github.github-vscode-theme
        github.vscode-github-actions
        ms-python.python
        bbenoist.nix
      ];
      userSettings = {
         "window.titleBarStyle" = "custom";
      };
    };
  };
}
