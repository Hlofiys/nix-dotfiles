{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    languages = {
      language-server.nixd = with pkgs; {
        command = "${nixd}/bin/nixd";
      };
      language = [{
        name = "nix";
        language-servers = [ "nixd" ];
      }];
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
      typescript-language-server
      ruff
      clang
      nixd
      delve
    ];
  };
}
