{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fastfetch
    zip
    github-copilot-cli
  ];
}
