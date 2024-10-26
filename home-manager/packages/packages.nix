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
  ];

  home.packages = with pkgs; [
    # gui
    # mpv
    # libreoffice
    # spotify
    # d-spy
    # github-desktop
    # gimp
    # krita
    # transmission_4-gtk
    # vesktop
    # icon-library
    # dconf-editor
#    jetbrains.rider
    # telegram-desktop
    # bottles
    # protonplus
    # figma-linux
    # cartridges
    # postman
    prismlauncher
    # mangohud
    # goverlay
    gnome-extension-manager
    gnome-tweaks

    # tools
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

    # fun
    # glow
    # slides
    # yabridge
    # yabridgectl
    # wine-staging
    # ani-cli
  ];
}
