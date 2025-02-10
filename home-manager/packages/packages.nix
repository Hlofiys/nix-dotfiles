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
    ./zed.nix
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
    discord
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
    stable.gnome-extension-manager
    gnome-tweaks
    spotify
    ghostty

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

    #sdks
    dotnet-sdk_9
    dotnet-ef
    go
    rustc
    cargo
    jdk
  ];
}
