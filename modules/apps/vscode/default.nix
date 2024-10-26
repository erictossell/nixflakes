{
  pkgs,
  username,
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
        vscodevim.vim
        #github.copilot
        github.github-vscode-theme
        github.vscode-github-actions
        #ms-python.python
        ms-vscode.powershell
        bbenoist.nix
      ];
    };
  };
}
