{ pkgs, ... }:
{
  programs = {
    vscode = {
      enable = true;
      userSettings = {
        "terminal.integrated.fontFamily" = "CaskaydiaCove Nerd Font";
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "workbench.colorTheme" = "Catppuccin Mocha";
        "workbench.iconTheme" = "catppuccin-mocha";
        "window.menuBarVisibility" = "toggle";
        "vscord.status.idle.enabled" = false;
        "vscord.status.idle.check" = false;
      };
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        eamodio.gitlens
        ms-dotnettools.csharp
        csharpier.csharpier-vscode
        cweijan.vscode-database-client2
        visualstudioexptteam.vscodeintellicode
        christian-kohler.path-intellisense
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        leonardssh.vscord
        ms-azuretools.vscode-docker
      ];
    };
  };
}
