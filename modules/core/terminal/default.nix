{ pkgs, home-manager, username, ... }:
{  
   imports = [
    ./bash
    ./cava
    ./fonts
    ./foot
    ./kitty
    ./nvim
    ./starship
    ./tmux
   ];

   # ---- Home Configuration ----
   home-manager.users.${username} = { pkgs, ... }: {
     programs.git.enable = true;
     programs.vim.enable = true;
   };

   # ---- System Configuration ----
   programs = {
     htop.enable = true;
     mtr.enable = true;  
   };

   environment.systemPackages = with pkgs; [
     alacritty # backup terminal
     btop
     nitch
     vim
   ];
}
