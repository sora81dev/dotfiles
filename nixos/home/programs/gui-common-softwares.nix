{ pkgs, ... }:
{
  home.packages = with pkgs; [
    thunderbird
    osu-lazer-bin
    discord
    kdePackages.dolphin
  ];
}
