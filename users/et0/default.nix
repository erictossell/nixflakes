{ pkgs, ... }:
{
  users.users.et0 = {
    shell = pkgs.zsh;
    isNormalUser = true;
    initialPassword = "temp123";
    extraGroups = [
      "wheel"
      "input"
    ];
  };
}
