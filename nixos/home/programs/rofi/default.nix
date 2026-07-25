{ ... }:
{
  programs.rofi.enable = true;

  xdg.configFile."rofi".force = true;
  xdg.configFile."rofi".source = ./../../../../rofi;
}
