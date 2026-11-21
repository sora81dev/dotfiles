{ inputs, ... }: {
  imports = [
    ./btop
    ./cloudflare-cf
    ./cosmic-files
    ./direnv
    ./dolphin
    ./fcitx5
    ./games
    ./gazelle
    ./ghostty
    ./git
    ./latex
    ./mime-apps
    ./mpris-proxy
    ./nextcloud-client
    ./nh
    ./niri
    ./nvim
    ./obsidian
    ./rofi
    ./stm32
    ./swaync
    ./thunderbird
    ./vial
    ./vscode
    ./waybar
    ./wine
    ./wlogout
    ./zen-browser
    ./zsh

    ./gui-common-softwares.nix
  ];

  _module.args = { inherit inputs; };
}
