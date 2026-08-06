{ ... }:
{
  programs.lazygit.enable = true;

  xdg.configFile."lazygit".force = true;
  xdg.configFile."lazygit".source = ./../../../../lazygit;

  programs.gh.enable = true;
  xdg.configFile."gh".force = true;
  xdg.configFile."gh".source = ./../../../../gh;

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "sora81dev";
        email = "117363029+sora81dev@users.noreply.github.com";
      };
      init.defaultBranch = "main";

      credential.helper = "!gh auth git-credential";
    };
  };
}
