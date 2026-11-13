{ inputs, pkgs, ... }:
{
  imports = [
    ./ai.nix
  ];

  _module.args = { inherit inputs; };

  home.packages = with pkgs; [
    cloudflared
  ];
}
