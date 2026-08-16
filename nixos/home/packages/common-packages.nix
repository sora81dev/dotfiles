{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fastfetch
    github-copilot-cli
    jq
    playerctl
    simple-scan
    vlc
    zip
  ];
}
