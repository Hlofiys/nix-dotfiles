{
  pkgs,
  lib,
  ...
}:
{
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.file = {
    ".config/nvim" = {
      source = ../../nvim;
      recursive = true;
    };
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
}
