{ pkgs }:

pkgs.stdenvNoCC.mkDerivation {
  pname = "devicetree-language-server";
  version = "0.14.4";

  src = pkgs.fetchzip {
    url = "https://registry.npmjs.org/devicetree-language-server/-/devicetree-language-server-0.14.4.tgz";
    hash = "sha256-ifW1+M1JJ/i+utx8Nbm1JPWEENQQIz32Btx4cd8Ple8=";
  };

  nativeBuildInputs = [
    pkgs.makeWrapper
  ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/lib/node_modules/devicetree-language-server"
    mkdir -p "$out/bin"

    cp -r "$src"/. "$out/lib/node_modules/devicetree-language-server/"

    makeWrapper \
      "${pkgs.nodejs}/bin/node" \
      "$out/bin/devicetree-language-server" \
      --add-flags "$out/lib/node_modules/devicetree-language-server/dist/server.js"

    runHook postInstall
  '';

  meta = {
    description = "Devicetree language server";
    homepage = "https://github.com/kylebonnici/dts-lsp";
    license = pkgs.lib.licenses.asl20;
    mainProgram = "devicetree-language-server";
  };
}
