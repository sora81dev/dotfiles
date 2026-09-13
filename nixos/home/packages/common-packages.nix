{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Agent
    github-copilot-cli

    # Audio Control
    playerctl
    pwvucontrol

    # Circuit Editor
    kicad

    # Cloud Storage Service
    immich-cli

    # Create zip
    zip

    # grep for JSON
    jq

    # Java Programming Editor
    jetbrains.idea

    # Scannar
    simple-scan

    # System Information
    fastfetch

    # Music Player
    vlc

  ];
}
