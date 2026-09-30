{ inputs, ... }: {
  imports = [
    ./btop
    ./cloudflare-cf
    ./direnv
    ./dolphin
    ./fcitx5
    ./games
    ./gazelle
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
    ./zsh

    ./gui-common-softwares.nix
  ];

  _module.args = { inherit inputs; };
}
