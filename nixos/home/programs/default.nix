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
    ./thunderbird
    ./vial
    ./waybar
    ./wlogout
    ./zen-browser
    ./zoom
    ./zsh

    ./gui-common-softwares.nix
  ];

  _module.args = { inherit inputs; };
}
