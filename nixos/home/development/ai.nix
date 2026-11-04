{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cursor-cli
    github-copilot-cli
  ];
}
