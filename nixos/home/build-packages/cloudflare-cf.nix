{
  lib,
  stdenvNoCC,
  fetchurl,
  nodejs_22,
  makeWrapper,
  ...
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "cloudflare-cf";
  version = "1.0.0-beta.6";

  src = fetchurl {
    url = "https://registry.npmjs.org/cf/-/cf-${finalAttrs.version}.tgz";
    hash = "sha256-7VwnEvdq4NAkljYof+cb36g21DNIS9FEyoMSe+cA0Qc=";
  };

  nativeBuildInputs = [
    makeWrapper
  ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/lib/cloudflare-cf
    cp -r . $out/lib/cloudflare-cf/

    mkdir -p $out/bin

    makeWrapper ${nodejs_22}/bin/node $out/bin/cf \
      --add-flags "$out/lib/cloudflare-cf/bin/cf"

    makeWrapper ${nodejs_22}/bin/node $out/bin/cloudflare \
      --add-flags "$out/lib/cloudflare-cf/bin/cf"

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
    platforms = nodejs_22.meta.platforms;
  };
})
