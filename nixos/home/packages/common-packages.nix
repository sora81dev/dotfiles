{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # 3D Modeling
    blender

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

    # Programming Editor
    jetbrains.idea
    jetbrains.clion

    # Scannar
    simple-scan

    # System Information
    fastfetch

    # Text Editor
    marktext

    # Music Player
    cider-2
    vlc

    # Others
    wrangler

    # Programming
    arduino-ide

    icu
    libice
  ];
}
