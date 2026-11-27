{ pkgs, ... }:
let
  androidComposition = pkgs.androidenv.composeAndroidPackages {
    platformVersions = [
      "36"
      "37"
    ];
    buildToolsVersions = [ "36.0.0" ];
    includeEmulator = false;
    includeSystemImages = false;
    includeNDK = false;
  };
  androidSdk = androidComposition.androidsdk;
in
{
  home.packages = with pkgs; [
    # Graphical Serial Monitor with Graph
    serial-studio

    libGL
    androidSdk
  ];

  home.sessionVariables = {
    ANDROID_HOME = "${androidSdk}/libexec/android-sdk";
  };
}
