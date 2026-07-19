{ inputs, ... }: {
  imports = [
    ./games
    ./nvim
    ./zsh
    ./zen-browser

    ./gui-common-softwares.nix
  ];

  _module.args = { inherit inputs; };
}
