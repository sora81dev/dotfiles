{ pkgs, ... }:
{
  # Japanese Inputs
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
    ];
  };

  xdg.configFile."fcitx5".force = true;
  xdg.configFile."fcitx5".source = ./../../../../fcitx5;
}
