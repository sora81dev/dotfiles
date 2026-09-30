{ pkgs, ... }:
let
  cloudflare-cf = pkgs.callPackage ./../../build-packages/cloudflare-cf.nix { };
in
{
  home.packages = [
    cloudflare-cf
  ];
}
