{
  pkgs,
  username,
  attrs,
  outputs,
  lib,
  config,
  customArgs,
  ...
}: {
  imports = [ ./nh ];

  # https://github.com/lovesegfault/nix-config/blob/e412cd01cda084c7e3f5c1fbcf7d99665999949e/core/nixos.nix#L39
  system = {
    extraSystemBuilderCmds = ''
      ln -sv ${pkgs.path} $out/nixpkgs
    '';
    stateVersion = "24.05";
  };

  # # Enable Flakes and nix-commands, enable removing channels
  # nix = {
  #   package = pkgs.nixVersions.nix_2_21;
  #   nixPath = [ "nixpkgs=/run/current-system/nixpkgs" ];
  #   settings.experimental-features = [
  #     "nix-command"
  #     "flakes"
  #   ];
  # };
  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") attrs;
  in {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";

      # Opinionated: disable global registry
      flake-registry = "";

      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
    };
    # Opinionated: disable channels
    channel.enable = false;

    # Opinionated: make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  home-manager = {
    backupFileExtension = "backup";
    users.${username} = {
      # The home.stateVersion option does not have a default and must be set
      home.stateVersion = "24.05";
      nixpkgs.config.allowUnfree = true;
    };
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit attrs customArgs;
    };
  };

  # home = {
  #   username = "${username}";
  #   homeDirectory = "/home/${username}";
  #   stateVersion = "24.05";
  # };

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];

    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  # programs.home-manager = {
  #   enable = true;
  # };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
