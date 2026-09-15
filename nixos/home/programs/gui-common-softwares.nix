{ pkgs, ... }:
{
  home.packages = with pkgs; [
    chromium
    osu-lazer-bin
    rpi-imager
    discord
    vial
  ];
}
