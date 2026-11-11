{ inputs, pkgs, ... }:
{
  imports = [
    ./ai.nix
    ./nuttx.nix
    ./zephyr.nix
  ];

  _module.args = { inherit inputs; };

  home.packages = with pkgs; [
    cloudflared
  ];
}
