{ ... }:
{
  programs.lazygit.enable = true;

  xdg.configFile."lazygit".force = true;
  xdg.configFile."lazygit".source = ./../../../../lazygit;

  programs.gh.enable = true;
  xdg.configFile."gh".force = true;
  xdg.configFile."gh".source = ./../../../../gh;
}
