{ inputs, ... }:
{
  imports = [
    ./ai.nix
    ./zephyr.nix
  ];

  _module.args = { inherit inputs; };
}
