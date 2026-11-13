{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cursor-cli
    claude-code
    github-copilot-cli
  ];
}
