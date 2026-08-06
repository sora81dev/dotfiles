{ lib, ... }:
{
  programs.lazygit.enable = true;

  xdg.configFile."lazygit".force = true;
  xdg.configFile."lazygit".source = ./../../../../lazygit;

  programs.gh.enable = true;
  xdg.configFile."gh/config.yml".force = true;
  xdg.configFile."gh/config.yml".source = lib.mkForce ./../../../../gh/config.yml;

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
