{ inputs, ... }: {
  imports = [
    ./fcitx5
    ./games
    ./git
    ./niri
    ./nvim
    ./rofi
    ./waybar
    ./zen-browser
    ./zsh

    ./gui-common-softwares.nix
  ];

  _module.args = { inherit inputs; };
}
