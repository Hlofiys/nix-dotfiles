let
  email = "hlofiys@gmail.com";
  name = "Hlofiys";
in
{
  programs.git = {
    enable = true;
    extraConfig = {
      color.ui = true;
      core.editor = "vim";
      github.user = name;
      push.autoSetupRemote = true;
    };
    userEmail = email;
    userName = name;
  };
}
