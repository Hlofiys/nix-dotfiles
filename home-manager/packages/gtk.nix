{
  pkgs,
  config,
  ...
}:
let
  theme = {
    name = "adw-gtk3-dark";
    package = pkgs.adw-gtk3;
  };
  font = {
    name = "Inter Nerd Font";
    package = pkgs.inter-nerdfont;
    size = 11;
  };
  iconTheme = {
    name = "MoreWaita";
    package = pkgs.morewaita-icon-theme;
  };
in
{
  home = {
    packages = with pkgs; [
      cantarell-fonts
      font-awesome
      theme.package
      font.package
      iconTheme.package
      adwaita-icon-theme
      papirus-icon-theme
      nerd-fonts.ubuntu-mono
      nerd-fonts.caskaydia-cove
      nerd-fonts.meslo-lg
    ];
  };

  fonts.fontconfig.enable = true;

  gtk = {
    inherit font iconTheme;
    theme.name = theme.name;
    enable = true;
  };

  # qt = {
  #   enable = true;
  #   platformTheme.name = "adwaita";
  #   style.name = "adwaita-dark";
  # };

  home.file.".local/share/flatpak/overrides/global".text =
    let
      dirs = [
        "/nix/store:ro"
        "xdg-config/gtk-3.0:ro"
        "xdg-config/gtk-4.0:ro"
        "${config.xdg.dataHome}/icons:ro"
      ];
    in
    ''
      [Context]
      filesystems=${builtins.concatStringsSep ";" dirs}
    '';
}
