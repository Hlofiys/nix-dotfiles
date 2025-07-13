{ pkgs, inputs, ... }:
{
  imports = [
    ./git.nix
    ./direnv.nix
    ./sh.nix
    ./starship.nix
    ./nvim.nix
    
    ./browser.nix
    ./vscode.nix
    ./wezterm.nix
    ./helix.nix
    ./k9s.nix
    ./kde.nix
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
    (discord.override {
      withVencord = true;
    })
    icon-library
    dconf-editor
    telegram-desktop
    bottles
    heroic
    postman
    prismlauncher
    mangohud
    goverlay
    spotify
    ghostty
    code-cursor
    pkgs.catppuccin-kde
    # kdePackages.kdegraphics-thumbnailers
    # kdePackages.gwenview
    # kdePackages.spectacle
    # kdePackages.kolourpaint
    # kdePackages.ark
    # kdePackages.dolphin
    # kdePackages.konsole
    # kdePackages.kate
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
