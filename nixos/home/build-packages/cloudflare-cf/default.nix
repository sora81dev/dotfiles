{
  lib,
  buildNpmPackage,
  nodejs_24,
  makeWrapper,
  ...
}:

buildNpmPackage {
  pname = "cloudflare-cf";
  version = "1.0.0-beta.29";

  src = ./.;

  nodejs = nodejs_24;

  npmDepsHash = "sha256-BmOxosAu83OEVY3J+GYjGhPK0X/oVMFrvT/7aaF1OvE=";

  dontNpmBuild = true;

  nativeBuildInputs = [
    makeWrapper
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/lib/cloudflare-cf
    mkdir -p $out/bin

    cp -a node_modules $out/lib/cloudflare-cf/

    makeWrapper ${nodejs_24}/bin/node $out/bin/cf \
      --add-flags "$out/lib/cloudflare-cf/node_modules/cf/bin/cf"

    makeWrapper ${nodejs_24}/bin/node $out/bin/cloudflare \
      --add-flags "$out/lib/cloudflare-cf/node_modules/cf/bin/cf"

    runHook postInstall
  '';

  meta = {
    description = "The Cloudflare CLI";
    homepage = "https://github.com/cloudflare/cf";
    license = with lib.licenses; [
      mit
      asl20
    ];
    mainProgram = "cf";
    platforms = nodejs_24.meta.platforms;
  };
}
