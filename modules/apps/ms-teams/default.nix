{
  username,
  pkgs,
  ...
}: {

  environment.systemPackages = with pkgs; [ unstable.teams-for-linux ];

#   #----- Home Manager Config -----
#   home-manager.users.${username} = {

#     home.sessionVariables = {
#       MOZ_ENABLE_WAYLAND = 1;
#     };

#     programs.firefox = {
#       enable = true;
#       profiles = {
#         ${username} = {
#           isDefault = true;
#           settings = {
#             "browser.startup.homepage" = "www.google.com";
#           };
#         };
#       };
#     };
#   };
}