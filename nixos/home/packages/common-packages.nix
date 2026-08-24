{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fastfetch
    github-copilot-cli
    jetbrains.idea
    jq
    playerctl
    simple-scan
    vlc
    zip
  ];
}
