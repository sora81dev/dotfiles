{ inputs, ... }:
{
  imports = [
    ./zephyr.nix
  ];

  _module.args = { inherit inputs; };
}
