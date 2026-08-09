{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rpi-imager
  ];

  security.polkit.enable = true;
  services.udisks2.enable = true;
}
