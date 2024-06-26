{ pkgs, ... }:
{
  xdg.desktopEntries = {
    "lf" = {
      name = "lf";
      noDisplay = true;
    };
  };

  home.packages = with pkgs; with gnome; [
    # colorscript
    (import ./colorscript.nix { inherit pkgs; })

    # gui
    obsidian
    (mpv.override { scripts = [mpvScripts.mpris]; })
    libreoffice
    spotify
#    caprine-bin
    d-spy
    github-desktop
    gimp
    transmission_4-gtk
    vesktop
    icon-library
    dconf-editor
    vscode.fhs
    telegram-desktop
    bottles    
    protonup-qt
    figma-linux
    cartridges
    postman
    thunderbird
    prismlauncher
    mangohud
    goverlay

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
    nil

    # fun
    glow
    slides
    yabridge
    yabridgectl
    wine-staging
    distrobox
    ani-cli
  ];
}
