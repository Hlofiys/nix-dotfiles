{ pkgs, ... }:
{
  programs = {
    zed-editor = {
      enable = true;
      userSettings = {
        features = {
          copilot = false;
        };
        telemetry = {
          metrics = false;
        };
        vim_mode = false;
        ui_font_size = 16;
        buffer_font_size = 16;
        theme = {
          mode = "system";
          light = "One Light";
          dark = "Catppuccin Mocha";
        };
        terminal = {
          font-family = "MesloLGS NF";
        };
        languages = {
          Nix = {
            language_servers = [
              "nixd"
              "!nil"
            ];
          };
        };
        lsp = {
          discord_presence = {
            idle = {
              action = null;
            };
            git_integration = true;
          };
        };
      };
      extensions = [
        "html"
        "catppuccin"
        "dockerfile"
        "git-firefly"
        "sql"
        "terraform"
        "docker-compose"
        "csharp"
        "nix"
        "discord-presence"
      ];
    };
  };
}
