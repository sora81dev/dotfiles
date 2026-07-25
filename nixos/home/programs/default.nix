{ inputs, ... }: {
  imports = [
    ./games
    ./git
    ./nvim
    ./rofi
    ./zsh
    ./zen-browser

    ./gui-common-softwares.nix
  ];

  _module.args = { inherit inputs; };
}
