{ pkgs, ... }:
{
  home.packages = with pkgs; [
    swaynotificationcenter
  ];

  xdg.configFile."swaync".force = true;
  xdg.configFile."swaync".source = ./../../../../swaync;
}
