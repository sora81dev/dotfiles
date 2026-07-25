{ }:
{
  programs.lazygit.enable = true;

  xdg.configFile."lazygit".force = true;
  xdg.configFile."lazygit".source = ./../../../../lazygit;
}
