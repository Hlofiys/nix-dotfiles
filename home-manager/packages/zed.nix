{
  programs = {
    zed-editor = {
      enable = false;
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
        terminal = {
          font-family = "MesloLGS NF";
        };
        assistant = {
          default_model = {
            provider = "google";
            model = "gemini-2.0-flash";
          };
          inline_alternatives = [
            {
              provider = "google";
              model = "gemini-2.0-flash-lite";
            }
          ];
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
        "wakatime"
      ];
    };
  };
}
