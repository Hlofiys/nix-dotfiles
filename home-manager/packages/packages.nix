{ pkgs, inputs, ... }:
{
  imports = [
    ./git.nix
    ./direnv.nix
    ./gtk.nix
    ./sh.nix
    ./starship.nix
    ./nvim.nix
    ./dconf.nix
    ./browser.nix
    ./vscode.nix
    ./wezterm.nix
    ./helix.nix
    ./k9s.nix
    ./zed.nix
  ];

  home.packages = with pkgs; [
    # gui
    mpv
    libreoffice-fresh
    d-spy
    github-desktop
    gimp
    krita
    transmission_4-gtk
    (discord.override {
      withVencord = true;
    })
    icon-library
    dconf-editor
    telegram-desktop
    bottles
    heroic
    protonplus
    cartridges
    postman
    prismlauncher
    mangohud
    goverlay
    gnome-extension-manager
    gnome-tweaks
    spotify
    ghostty
    jetbrains.datagrip
    inputs.zen-browser.packages.x86_64-linux.default
    code-cursor
    zed-editor-fhs

    # tools
    fastfetch
    bat
    eza
    fd
    ripgrep
    fzf
    libnotify
    killall
    zip
    unzip
    glib
    lazygit
    lazydocker
    nixd
    nixfmt-rfc-style
    gcc
    fishPlugins.tide
    bsac-cli
    android-tools
    usbutils
    devenv
    vscode-fhs
    unar

    #devops
    terraform
    talosctl
    kubectl

    # fun
    glow
    slides
    yabridge
    yabridgectl
    wine-staging
    ani-cli
    vcmi
    arnis

    # sdk
    dotnet-sdk_9
    dotnet-ef

    # lsp
    rust-analyzer
    netcoredbg
    omnisharp-roslyn
    docker-compose-language-service
    yaml-language-server
    dockerfile-language-server-nodejs
    gopls
    terraform-ls
    vscode-langservers-extracted
    typescript-language-server
    ruff
    nixd
    delve
  ];
}
