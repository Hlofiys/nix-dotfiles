{
  config,
  pkgs,
  ...
}:
let
  starshipCmd = "${pkgs.starship}/bin/starship";
in
{
  # xdg.configFile."starship.toml" = {
  #   source = tomlFormat.generate "starship-config" settings;
  # };
  programs.starship.enable = false;
  programs.starship.settings = pkgs.lib.importTOML ../../starship.toml;


  programs.bash.initExtra = ''
    eval "$(${starshipCmd} init bash)"
  '';

  programs.zsh.initExtra = ''
    eval "$(${starshipCmd} init zsh)"
  '';

  # programs.fish.shellInit= ''
  #   eval "$(${starshipCmd} init fish)"
  #   '';

  programs.nushell = {
    extraEnv = ''
      mkdir ${config.xdg.cacheHome}/starship
      ${starshipCmd} init nu | save -f ${config.xdg.cacheHome}/starship/init.nu
    '';
    extraConfig = ''
      use ${config.xdg.cacheHome}/starship/init.nu
    '';
  };

  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
  };
  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };
}
