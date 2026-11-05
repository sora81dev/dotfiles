{ pkgs, ... }:
let
  fcitx5-meltype = pkgs.callPackage ../../build-packages/fcitx5-meltype.nix { };
in
{
  # Required so fcitx5's gtk-im-module=fcitx settings apply to XWayland GTK apps.
  gtk.enable = true;

  # Japanese Inputs
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      fcitx5-meltype
    ];
  };

  xdg.configFile."fcitx5" = {
    source = ./../../../../fcitx5;
    recursive = true;
  };
}
