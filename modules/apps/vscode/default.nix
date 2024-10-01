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
        "workbench.colorCustomizations" = {
          "[Default Dark+]" = {
              "editorBracketHighlight.foreground1" = "#5b8fdd";
              "editorBracketHighlight.foreground2" = "#da89af";
              "editorBracketHighlight.foreground3" = "#19f9d8";
              "editorBracketHighlight.foreground4" = "#b58ceb";
              "editorBracketHighlight.foreground5" = "#cde97f";
              "editorBracketHighlight.foreground6" = "#7cf07c";
              "editorBracketHighlight.unexpectedBracket.foreground" = "#f31154";
            };
        };
        "editor.tokenColorCustomizations" = {
          "textMateRules" = [
            {
              "scope" = "string.quoted.docstring.multi.python";
              "settings" = {
                "foreground" = "#c18972";
              };
            }
          ];
        };
        "editor.minimap.renderCharacters" = false;
        "editor.minimap.showSlider" = "always";
        "editor.minimap.size" = "fit";
        "[python]" = {
          "editor.defaultFormatter" = null;
          "editor.formatOnType" = true;
          "editor.codeActionsOnSave" = {
            "source.fixAll.ruff" = "always";
            "source.organizeImports.ruff" = "explicit";
          };
        };
        "editor.defaultFormatter" = "trunk.io";
        #"editor.fontFamily" = "'M+1Code Nerd Font','Droid Sans Mono', 'monospace'";
        "github.copilot.enable" = {
          "*" = true;
          "plaintext" = false;
          "markdown" = true;
          "scminput" = false;
          "python" = true;
          "c++" = true;
          "c" = true;
          "yaml" = true;
        };
        "editor.inlineSuggest.enabled" = true;
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
