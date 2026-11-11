{ inputs, ... }:
{
  imports = [
    ./ai.nix
    ./nuttx.nix
    ./zephyr.nix
  ];

  _module.args = { inherit inputs; };
}
