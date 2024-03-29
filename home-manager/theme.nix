{ pkgs, ... }:
let
  nerdfonts = (pkgs.nerdfonts.override { fonts = [
    "Ubuntu"
    "UbuntuMono"
    "CascadiaCode"
    "FantasqueSansMono"
    "FiraCode"
    "Mononoki"
  ]; });

  theme = {
    name = "adw-gtk3-dark";
    package = pkgs.adw-gtk3;
  };
  # font = {
  #   name = "Ubuntu Nerd Font";
  #   package = nerdfonts;
  # };
  cursorTheme = {
    name = "Qogir";
    size = 24;
    package = pkgs.qogir-icon-theme;
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
      nerdfonts
      cursorTheme.package
      iconTheme.package
      gnome.adwaita-icon-theme
    ];
    sessionVariables = {
      XCURSOR_THEME = cursorTheme.name;
      XCURSOR_SIZE = "${toString cursorTheme.size}";
    };
    pointerCursor = cursorTheme // {
      gtk.enable = true;
    };
    file = {
      ".local/share/themes/${theme.name}" = {
        source = "${theme.package}/share/themes/${theme.name}";
      };
      # .background.csd{
      #     border-radius: 0;
      #   }
      ".config/gtk-4.0/gtk.css".text = ''
        window.messagedialog .response-area > button,
        window.dialog.message .dialog-action-area > button,
      '';
    };
  };

  fonts.fontconfig.enable = true;

  gtk = {
    #font
    inherit cursorTheme iconTheme;
    theme.name = theme.name;
    enable = true;
    # decoration{
    #     border-radius: 0;
    #   }
    gtk3.extraCss = ''
      headerbar, .titlebar,
      .csd:not(.popup):not(tooltip):not(messagedialog)
    '';
  };

  qt = {
    enable = true;
    platformTheme = "kde";
  };
}
