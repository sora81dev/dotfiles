{ inputs, pkgs, ... }:
let
  zephyr = inputs.zephyr-nix.packages.${pkgs.stdenv.hostPlatform.system};

  zephyrSdk = zephyr.sdk.override {
    targets = [ "arm-zephyr-eabi" ];
  };
in
{
  home.packages = with pkgs; [
    zephyrSdk

    zephyr.pythonEnv
    zephyr.hosttools-nix

    cmake
    ninja
    git
    openocd
  ];

  home.sessionVariables = {
    ZEPHYR_TOOLCHAIN_VARIANT = "zephyr";
    ZEPHYR_SDK_INSTALL_DIR = "${zephyrSdk}";
  };
}
