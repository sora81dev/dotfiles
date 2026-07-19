{ pkgs, ... }:
{
  services.xserver.enable = true;
  # services.displayManager.gdm.enable = true;
  # services.desktopManager.gnome.enable = true;
  services.displayManager.sddm.enable = true;

  environment.systemPackages = with pkgs; [
    # Lockdesign
    swaylock

    # For Compatibility
    xwayland-satellite

    # Application Execute
    rofi

    # Top Infobar
    waybar

    # Wallpaper
    hyprpaper

    # Quick Insert NerdFonts
    rofimoji
    wl-clipboard

    # Control Brightess with CLI
    brightnessctl

    # Control Audio with CLI
    pulseaudio
  ];

  programs.niri.enable = true;
  programs.xwayland.enable = true;
}
