{ ... }:
{
  programs.waybar.enable = true;

  xdg.configFile."waybar".force = true;
  xdg.configFile."waybar".source = ./../../../../waybar;
}
