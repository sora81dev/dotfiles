{ pkgs, ... }:
let
  cloudflare-cf = pkgs.callPackage ./../../build-packages/cloudflare-cf { };
in
{
  home.packages = [
    cloudflare-cf
  ];
}
