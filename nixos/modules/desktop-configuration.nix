{ pkgs, lib, ... }:
let
  xwayland-satellite-latest = pkgs.xwayland-satellite.overrideAttrs (old: rec {
    version = "0.8.3";
    src = pkgs.fetchFromGitHub {
      owner = "Supreeeme";
      repo = "xwayland-satellite";
      tag = "v${version}";
      hash = "sha256-eFEjCCniMCKeWU0PcZNv+tDYe08SLFPjRplyPY8OFt4=";
    };
    cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
      inherit src;
      name = "xwayland-satellite-${version}";
      hash = "sha256-gMGFvnbxM3hD5fmkSimaFd87GEf6BXFe/MGjoS6VNVU=";
    };
  });
in
{
  services.xserver.enable = true;
  # services.displayManager.gdm.enable = true;
  # services.desktopManager.gnome.enable = true;
  services.displayManager.sddm.enable = true;

  environment.systemPackages = with pkgs; [
    # For Compatibility
    xwayland-satellite-latest

    # Top Infobar
    waybar

    # Wallpaper
    hyprpaper

    # Quick Insert NerdFonts
    rofimoji
    wl-clipboard

    # Control Brightess with CLI
    brightnessctl
  ];

  programs.niri.enable = true;
  programs.xwayland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
