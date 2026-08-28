{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fastfetch
    github-copilot-cli
    jetbrains.idea
    jq
    kicad
    playerctl
    simple-scan
    vlc
    zip
  ];
}
