{ inputs, ... }: {
  imports = [
    ./games
    ./git
    ./nvim
    ./rofi
    ./waybar
    ./zen-browser
    ./zsh

    ./gui-common-softwares.nix
  ];

  _module.args = { inherit inputs; };
}
