{ inputs, ... }: {
  imports = [
    ./direnv
    ./dolphin
    ./fcitx5
    ./games
    ./git
    ./latex
    ./mpris-proxy
    ./nextcloud-client
    ./niri
    ./nvim
    ./rofi
    ./stm32
    ./swaync
    ./vial
    ./waybar
    ./wezterm
    ./wlogout
    ./zen-browser
    ./zsh

    ./gui-common-softwares.nix
  ];

  _module.args = { inherit inputs; };
}
