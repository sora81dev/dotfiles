{ inputs, ... }: {
  imports = [
    ./firefox
    ./nvim
    ./shell
    ./zen-browser

    ./gui-common-softwares.nix
  ];

  _module.args = { inherit inputs; };
}
