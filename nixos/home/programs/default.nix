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
    ./stm32
    ./waybar
    ./wezterm
    ./wlogout
    ./zen-browser
    ./zsh

    ./gui-common-softwares.nix
  ];

  _module.args = { inherit inputs; };
}
