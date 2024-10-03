# This file defines overlays
{
  attrs,
}:
{


  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs final.pkgs;

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
  };

  # When applied, the unstable nixpkgs set (declared in the flake attrs) will
  # be accessible through 'pkgs.unstable'
  unstable-packages = final: _prev: {
    unstable = import attrs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };

   # xargsOverlay = final: _prev: {
  #   xargs = 
  #   let
  #     system = final.system;
  #   in
  #   { hidpi }: {
  #     inherit hidpi;
  #     inherit (attrs.inputs) penguin-fox;
  #     inherit (attrs.inputs.rycee-nurpkgs.lib.${system}) buildFirefoxXpiAddon;
  #     addons = final.nur.repos.rycee.firefox-addons;
  #   };
  # };
}
# in
# [
#   #additions
#   #modifications
#   unstable-packages
#   xargsOverlay
#   attrs.inputs.nurpkgs.overlay
# ]
