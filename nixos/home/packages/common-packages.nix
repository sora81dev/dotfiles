{ pkgs, ... }:
let
  # Skiko (Compose Desktop) dlopens libGL.so.1, which is not on the loader path on NixOS
  idea = pkgs.symlinkJoin {
    name = "intellij-idea-wrapped";
    paths = [ pkgs.jetbrains.idea ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/intellij-idea \
        --prefix LD_LIBRARY_PATH : ${
          pkgs.lib.makeLibraryPath [
            pkgs.libGL
            pkgs.fontconfig
            pkgs.libX11
            pkgs.libXext
            pkgs.libXrender
            pkgs.libXi
            pkgs.libXtst
          ]
        }:/run/opengl-driver/lib
    '';
  };
in
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
    idea
    jetbrains.clion

    # Scannar
    simple-scan

    # System Information
    fastfetch

    # Text Editor
    marktext

    # Music Player
    vlc

    # Others
    wrangler

    # Programming
    arduino-ide

    icu
    libice
  ];
}
