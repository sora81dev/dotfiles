{ ... }:
{
  programs.rofi.enable = true;

  home.file."rofi".force = true;
  home.file."rofi".source = ./../../../../rofi;
}
