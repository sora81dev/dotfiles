{ inputs, pkgs, ... }:
let
  zephyr = inputs.zephyr-nix.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  home.packages = with pkgs; [
    (zephyr.sdk.override {
      targets = [ "arm-zephyr-eabi" ];
    })

    zephyr.pythonEnv
    zephyr.hosttools-nix

    cmake
    ninja
    git
    openocd
  ];
}
