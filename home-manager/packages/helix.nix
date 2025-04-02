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
  };
}
