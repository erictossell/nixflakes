{ pkgs, username, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    shell = pkgs.fish;
    isNormalUser = true;
    initialPassword = "temp123";
    extraGroups = [
      "wheel"
      "input"
      "video"   # nvidia driver with video enabled
      "render"  # nvidia driver with rendering enabled
      "compute" # nvidia driver with compute enabled
    ];
  };
}
