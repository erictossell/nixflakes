{ pkgs, home-manager, username, ... }: {

  #
  home-manager.users.${username} = {
    home.file = {

      # Configuration for 1password SSH Agent.
      ".ssh/config".text = ''
        Host *
          IdentityAgent ~/.1password/agent.sock
      '';

      # Configure 1password to handle SSH commit signing
      ".gitconfig".text = ''
        [user]
          name = "Eric Tossell"
          email = erictossell@gmail.com	
          signingkey = ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJlYStL/v+XPU4XwmEhbJqtQSh5b8qcoj8GllynuqKP6

        [gpg]
          format = ssh

        [gpg "ssh"]
          program = "/run/current-system/sw/bin/op-ssh-sign"

        [commit]
          gpgsign = true
      '';
    };
  };

  # Enable 1password plugins on interactive shell init
  programs.bash.interactiveShellInit = ''
    source /home/${username}/.config/op/plugins.sh
  '';

  # Enable 1password and the CLI
  programs = {
    _1password.enable = true;
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [ "${username}" ];
    };
  };

  # Enable 1password to open with gnomekeyring
  security.pam.services."1password".enableGnomeKeyring = true;

}

