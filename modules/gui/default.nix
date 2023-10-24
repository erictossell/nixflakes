{ gui, ... }:
let
  guiSet = {
    "hypr-nvidia" = [ (import ./hyprland/nvidia) ];
    "hypr" = [ (import ./hyprland/standard) ];
    "gnome" = [ (import ./gnome) ];
    "plasma" = [ (import ./plasma) ];
  };
in
{
  imports = [
    ./apps
  ] ++ (guiSet.${gui} or [ ]); 
}
