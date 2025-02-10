{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha";
    };
    extraPackages = with pkgs; [
      rust-analyzer
      netcoredbg
      omnisharp-roslyn
      docker-compose-language-service
      yaml-language-server
      dockerfile-language-server-nodejs
      gopls
      terraform-ls
      vscode-langservers-extracted
      nil
      delve
    ];
  };
}
