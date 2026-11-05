{
  lib,
  stdenv,
  fetchurl,
  fetchFromGitHub,
  unzip,
  cmake,
  pkg-config,
  kdePackages,
  fcitx5,
  autoPatchelfHook,
  zlib,
  icu,
  patchelf,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "fcitx5-meltype";
  version = "1.4.0";

  # Prebuilt NativeAOT core + Mozc helper (from release zip).
  src = fetchurl {
    url = "https://github.com/yksr-melt/Meltype/releases/download/v${finalAttrs.version}/Meltype-${finalAttrs.version}-linux.zip";
    hash = "sha256-DNePfymBrMqlImTa3Jxx5gR6ShyQRHKjURvkCUGQsto=";
  };

  # fcitx5 addon sources (rebuild against nixpkgs fcitx5).
  addonSrc = fetchFromGitHub {
    owner = "yksr-melt";
    repo = "Meltype";
    rev = "v${finalAttrs.version}";
    hash = "sha256-jN2GYB6dritmmYSXfAoRmRO4WzQVJugxKyR+OgGPSWw=";
  };

  nativeBuildInputs = [
    unzip
    cmake
    pkg-config
    kdePackages.extra-cmake-modules
    autoPatchelfHook
    patchelf
  ];

  buildInputs = [
    fcitx5
    zlib
    stdenv.cc.cc.lib
    icu
  ];

  # NativeAOT dlopens libicuuc/libicui18n at runtime (not in DT_NEEDED).
  # Expose ICU to fcitx5-with-addons via LD_LIBRARY_PATH as well.
  passthru.extraLdLibraries = [ icu ];

  # Zip contains a Japanese readme; keep UTF-8 so unzip does not fail.
  unpackPhase = ''
    runHook preUnpack
    export LANG=C.UTF-8 LC_ALL=C.UTF-8
    unzip -q "$src"
    runHook postUnpack
  '';

  sourceRoot = "Meltype-linux";

  dontUseCmakeConfigure = true;

  buildPhase = ''
    runHook preBuild

    cmake -S "$addonSrc/linux/fcitx5" -B build-fcitx5 \
      -DCMAKE_BUILD_TYPE=Release \
      -DMELTYPE_DIR="$out/lib/meltype"
    cmake --build build-fcitx5

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    meltypeDir="$out/lib/meltype"
    mkdir -p "$meltypeDir/mozc" \
      "$out/lib/fcitx5" \
      "$out/share/fcitx5/addon" \
      "$out/share/fcitx5/inputmethod"

    install -m644 libMeltypeNative.so "$meltypeDir/"
    install -m755 mozc/meltype_mozc_helper "$meltypeDir/mozc/"
    install -m644 mozc/MOZC-LICENSE.txt mozc/MOZC-CREDITS.html "$meltypeDir/mozc/"
    install -m644 icon.png LICENSE THIRD-PARTY-NOTICES.md "$meltypeDir/"

    install -m644 build-fcitx5/meltype.so "$out/lib/fcitx5/"
    install -m644 "$addonSrc/linux/fcitx5/meltype-addon.conf" \
      "$out/share/fcitx5/addon/meltype.conf"
    substitute "$addonSrc/linux/fcitx5/meltype.conf" \
      "$out/share/fcitx5/inputmethod/meltype.conf" \
      --replace-fail '@DIR@' "$meltypeDir"

    runHook postInstall
  '';

  postFixup = ''
    # Ensure NativeAOT can dlopen ICU even without relying on LD_LIBRARY_PATH.
    patchelf --add-rpath "${lib.getLib icu}/lib" "$out/lib/meltype/libMeltypeNative.so"
  '';

  meta = {
    description = "Meltype Japanese input method for fcitx5";
    homepage = "https://github.com/yksr-melt/Meltype";
    license = lib.licenses.gpl3Plus;
    platforms = [ "x86_64-linux" ];
  };
})
