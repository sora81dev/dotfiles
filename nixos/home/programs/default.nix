{ inputs, ... }: {
  imports = [
    ./dolphin
    ./fcitx5
    ./games
    ./git
    ./latex
    ./niri
    ./nvim
    ./rofi
    ./waybar
    ./wezterm
    ./zen-browser
    ./zsh

    ./gui-common-softwares.nix
  ];

  _module.args = { inherit inputs; };
}
