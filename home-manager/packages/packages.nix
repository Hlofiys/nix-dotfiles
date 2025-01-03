{ pkgs, ... }:
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
  ];

  home.packages = with pkgs; [
    # gui
    mpv
    libreoffice
    d-spy
    github-desktop
    gimp
    krita
    transmission_4-gtk
    vesktop
    icon-library
    dconf-editor
    telegram-desktop
    bottles
    protonplus
    cartridges
    postman
    prismlauncher
    mangohud
    goverlay
    gnome-extension-manager
    gnome-tweaks

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
    spotify

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

    #sdks
    dotnet-sdk_9
    dotnet-ef
    go
    rustc
    cargo
    jdk
  ];
}
