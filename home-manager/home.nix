{ pkgs, username, ... }:
let
  homeDirectory = "/home/${username}";
in
{
  imports = [
   # ./ags.nix
    ./blackbox.nix
    ./browser.nix
    #./bspwm.nix
    ./dconf.nix
    ./git.nix
    ./helix.nix
    #./hyprland.nix
    ./lf.nix
    ./neofetch.nix
    ./neovim.nix
    ./packages.nix
    ./sh.nix
    ./starship.nix
    ./stm.nix
    #./sway.nix
    ./theme.nix
    ./tmux.nix
    ./wezterm.nix
  ];

  #news.display = "show";

  targets.genericLinux.enable = true;

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };

  home = {
    inherit username homeDirectory;

    sessionVariables = {
      NIXPKGS_ALLOW_UNFREE = "1";
      NIXPKGS_ALLOW_INSECURE = "1";
      BAT_THEME = "base16";
      #GOPATH = "${homeDirectory}/.local/share/go";
      #GOMODCACHE="${homeDirectory}/.cache/go/pkg/mod";
      DOTNET_ROOT = "${pkgs.dotnet-sdk_8}";
      PATH="$PATH:/home/hlofiys/.dotnet/tools";
    };

    sessionPath = [
      "$HOME/.local/bin"
    ];
  };

  gtk.gtk3.bookmarks = [
    "file:///mnt/files"
    "file:///mnt/games"
    "file://${homeDirectory}/Documents"
    "file://${homeDirectory}/Music"
    "file://${homeDirectory}/Pictures"
    "file://${homeDirectory}/Videos"
    "file://${homeDirectory}/Downloads"
    "file://${homeDirectory}/Desktop"
    "file://${homeDirectory}/Projects"
    "file://${homeDirectory}/Vault"
    "file://${homeDirectory}/Vault/School"
    "file://${homeDirectory}/.config Config"
    "file://${homeDirectory}/.local/share Local"
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "21.11";
}
