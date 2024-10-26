{pkgs, ...}:
{
  programs = {
    vscode = {
      enable = true;
      userSettings = {
        "terminal.integrated.fontFamily" = "CaskaydiaCove Nerd Font";
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
      };
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        eamodio.gitlens
	      ms-dotnettools.csharp
        csharpier.csharpier-vscode
        cweijan.vscode-database-client2
        visualstudioexptteam.vscodeintellicode
        christian-kohler.path-intellisense
      ];
    };
  };
}
