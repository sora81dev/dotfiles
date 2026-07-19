{ inputs, ... }: {
  imports = [
    ./firefox
    ./nvim
    ./shell
    ./zen-browser
    ./games

    ./gui-common-softwares.nix
  ];

  _module.args = { inherit inputs; };
}
