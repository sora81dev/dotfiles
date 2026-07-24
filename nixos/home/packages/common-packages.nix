{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zip
    github-copilot-cli
  ];
}
