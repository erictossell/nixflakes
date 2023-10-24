{ pkgs, home-manager, username, ... }:

{  
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      scan_timeout = 10;
      format = ''
  [┌───────────────────>](bold green)
  [│](bold green)$all$username$character$directory$cmd_duration
  [└─>](bold green)
  '';
      username = {
        style_user = "green";
        style_root = "red";
        format = "[$user]($style) ";
        disabled = false;
        show_always = true;
      };
      cmd_duration = {
        min_time = 500;
        format = "previous took [$duration](bold yellow)";
      };
      localip = {
        ssh_only = true;
        format = "@[$localipv4](bold green) ";
      };
      directory = {
        read_only = " 󰌾";
      };
      docker_context = {
        symbol = " ";
      };
      git_branch = {
        symbol = " ";
      };
      golang = {
        symbol = " ";	
      };
      hostname = {
        ssh_symbol = " ";
      };
      nix_shell = {
        symbol = " ";
      };
      python = {
        symbol = " ";
      };
      os.symbols = {
        NixOS = " ";
      };		
    };
  };

}
