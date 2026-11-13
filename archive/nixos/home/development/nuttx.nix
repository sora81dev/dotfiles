{ pkgs, ... }:
{
  home.packages = with pkgs; [
    autoconf
    automake
    bison
    flex
    gperf
    gnum4
    gnumake
    libtool
    libusb1
    minicom
    pkg-config
    texinfo
    hidapi
    libftdi1
    jimtcl
    kconfig-frontends
    gcc-arm-embedded
  ];

  home.sessionVariables = {
    ACLOCAL_PATH = "${pkgs.pkg-config}/share/aclocal";
    M4 = "${pkgs.gnum4}/bin/m4";
  };
}
