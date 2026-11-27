# STM32CubeIDE (proprietary, ST login required for download)
#
# 1. Download "STM32CubeIDE Debian Linux Installer" (.sh.zip) from
#    https://www.st.com/en/development-tools/stm32cubeide.html
# 2. Add it to the store under a fixed name and copy the printed hash:
#      nix-prefetch-url --type sha256 --name st-stm32cubeide-linux.sh.zip \
#        file://$HOME/Downloads/stm32cubeide_<version>-Lin-Deb-x86_64.sh.zip
#      nix hash convert --hash-algo sha256 --to sri <printed-hash>
# 3. Paste the SRI hash below (and bump `version` if needed).
{ pkgs, lib }:

let
  version = "2.3.0";

  unwrapped = pkgs.stdenvNoCC.mkDerivation {
    pname = "stm32cubeide-unwrapped";
    inherit version;

    src = pkgs.requireFile {
      name = "st-stm32cubeide-linux.sh.zip";
      url = "https://www.st.com/en/development-tools/stm32cubeide.html";
      hash = "sha256-KVihB2s+kVVQOdYBYHGEi0sJtMylPt9DAgLs7CZ9PZ8=";
    };

    nativeBuildInputs = with pkgs; [
      unzip
      dpkg
    ];

    dontConfigure = true;
    dontBuild = true;
    dontFixup = true;

    unpackPhase = ''
      runHook preUnpack
      unzip -q "$src"
      installer=$(find . -maxdepth 1 -name 'stm32cubeide_*.sh' | head -1)
      sh "$installer" --noexec --nox11 --target extracted
      rm "$installer"
      deb=$(find extracted -maxdepth 1 -name 'stm32cubeide-*.deb' | head -1)
      dpkg-deb -x "$deb" root
      rm -r extracted
      runHook postUnpack
    '';

    installPhase = ''
      runHook preInstall
      mkdir -p "$out/opt"
      mv "root/opt/st/stm32cubeide_${version}" "$out/opt/stm32cubeide"
      test -x "$out/opt/stm32cubeide/stm32cubeide"
      runHook postInstall
    '';

    meta = {
      description = "STM32CubeIDE (unwrapped)";
      license = lib.licenses.unfree;
      platforms = [ "x86_64-linux" ];
    };
  };

  desktopItem = pkgs.makeDesktopItem {
    name = "stm32cubeide";
    desktopName = "STM32CubeIDE";
    exec = "stm32cubeide %F";
    icon = "${unwrapped}/opt/stm32cubeide/icon.xpm";
    categories = [ "Development" "IDE" ];
    startupWMClass = "STM32CubeIDE";
  };
in
pkgs.buildFHSEnv {
  name = "stm32cubeide";

  targetPkgs =
    pkgs: with pkgs; [
      unwrapped
      # Eclipse / SWT
      gtk3
      glib
      cairo
      pango
      gdk-pixbuf
      atk
      fontconfig
      freetype
      libGL
      libsecret
      libx11
      libxext
      libxi
      libxrender
      libxtst
      libxrandr
      libxcursor
      libxxf86vm
      # Toolchain / debug probes
      zlib
      ncurses
      ncurses5
      libusb1
      udev
      python3
      which
      coreutils
    ];

  # Eclipse/SWT is unreliable on native Wayland; run via XWayland.
  profile = ''
    export GDK_BACKEND=x11
  '';

  runScript = "${unwrapped}/opt/stm32cubeide/stm32cubeide";

  extraInstallCommands = ''
    mkdir -p "$out/share/applications"
    cp ${desktopItem}/share/applications/*.desktop "$out/share/applications/"
  '';

  meta = unwrapped.meta // {
    description = "STM32CubeIDE";
    mainProgram = "stm32cubeide";
  };
}
