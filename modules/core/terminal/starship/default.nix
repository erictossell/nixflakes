{ pkgs, home-manager, username, ... }: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      scan_timeout = 10;
      format = "$all";
      character = {
        success_symbol = "[>](bold green)";
        error_symbol = "[x](bold red)";
        vimcmd_symbol = "[<](bold green)";
      };

      git_commit = { tag_symbol = " tag "; };
      git_status = {
        ahead = ">";
        behind = "<";
        diverged = "<>";
        renamed = "r";
        deleted = "x";
      };
      cmd_duration = {
        min_time = 500;
        format = "took [$duration](bold yellow)";
      };
      aws = { symbol = "aws "; };
      azure = { symbol = "az "; };
      bun = { symbol = "bun "; };

      cmake = { symbol = "cmake "; };
      deno = { symbol = "deno "; };
      directory = { read_only = " ro"; };
      docker_context = { symbol = "docker "; };
      git_branch = { symbol = "git "; };
      golang = { symbol = "go "; };
      hostname = {
        ssh_only = false;
        format = " on [$hostname](bold red)\n";
        disabled = false;
      };
      lua = { symbol = "lua "; };
      nodejs = { symbol = "nodejs "; };
      memory_usage = { symbol = "memory "; };
      nim = { symbol = "nim "; };
      nix_shell = { symbol = "nix "; };
      os.symbols = {
        Alpaquita = "alq ";
        Alpine = "alp ";
        Amazon = "amz ";
        Android = "andr ";
        Arch = "rch ";
        Artix = "atx ";
        CentOS = "cent ";
        Debian = "deb ";
        DragonFly = "dfbsd ";
        Emscripten = "emsc ";
        EndeavourOS = "ndev ";
        Fedora = "fed ";
        FreeBSD = "fbsd ";
        Garuda = "garu ";
        Gentoo = "gent ";
        HardenedBSD = "hbsd ";
        Illumos = "lum ";
        Linux = "lnx ";
        Mabox = "mbox ";
        Macos = "mac ";
        Manjaro = "mjo ";
        Mariner = "mrn ";
        MidnightBSD = "mid ";
        Mint = "mint ";
        NetBSD = "nbsd ";
        NixOS = "nix ";
        OpenBSD = "obsd ";
        OpenCloudOS = "ocos ";
        openEuler = "oeul ";
        openSUSE = "osuse ";
        OracleLinux = "orac ";
        Pop = "pop ";
        Raspbian = "rasp ";
        Redhat = "rhl ";
        RedHatEnterprise = "rhel ";
        Redox = "redox ";
        Solus = "sol ";
        SUSE = "suse ";
        Ubuntu = "ubnt ";
        Unknown = "unk ";
        Windows = "win ";
      };
      package = { symbol = "pkg "; };
      purescript = { symbol = "purs "; };
      python = { symbol = "py "; };
      rust = { symbol = "rs "; };
      status = { symbol = "[x](bold red) "; };
      sudo = { symbol = "sudo "; };
      terraform = { symbol = "terraform "; };
      username = {
        style_user = "green bold";
        style_root = "red bold";
        format = "[$user]($style)";
        disabled = false;
        show_always = true;
      };
      zig = { symbol = "zig "; };
    };
  };
}
