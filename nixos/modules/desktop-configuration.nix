{ pkgs, ... }:
{
  services.xserver.enable = true;
  # services.displayManager.gdm.enable = true;
  # services.desktopManager.gnome.enable = true;
  services.displayManager.sddm.enable = true;

  environment.systemPackages = with pkgs; [
    # Niri
    swaylock
    xwayland-satellite
    rofi
    waybar
    hyprpaper
    brightnessctl
    rofimoji
    wl-clipboard
  ];

  programs.niri.enable = true;
  programs.xwayland.enable = true;
}
