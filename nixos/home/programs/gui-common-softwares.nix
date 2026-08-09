{ pkgs, ... }:
{
  home.packages = with pkgs; [
    chromium
    thunderbird
    osu-lazer-bin
    rpi-imager
    discord
  ];
}
