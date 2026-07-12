{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefoxpwa
  ];

  programs.firefox.enable = true;
}
