{
  programs = {
    direnv = {
      enable = true;
      #enableFishIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };

    fish.enable = true; # see note on other shells below
  };
}
