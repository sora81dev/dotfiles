{ pkgs, ... }:
{
  home.packages = with pkgs; [
    discord
    thunderbird
    osu-lazer-bin
    steam
  ];
}
