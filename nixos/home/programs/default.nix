{ inputs, ... }: {
  imports = [
    ./btop
    ./direnv
    ./dolphin
    ./fcitx5
    ./games
    ./ghostty
    ./git
    ./latex
    ./mpris-proxy
    ./nextcloud-client
    ./nh
    ./niri
    ./nvim
    ./rofi
    ./stm32
    ./swaync
    ./vial
    ./waybar
    ./wlogout
    ./zen-browser
    ./zsh

    ./gui-common-softwares.nix
  ];

  _module.args = { inherit inputs; };
}
