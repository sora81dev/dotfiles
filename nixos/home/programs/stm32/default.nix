{ pkgs, ... }:
let
  stm32cubeide = pkgs.callPackage ./../../build-packages/stm32cubeide.nix { };
in
{
  home.packages = with pkgs; [
    stm32cubemx
    stm32cubeide
  ];
}
