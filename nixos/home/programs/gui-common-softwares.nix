{ pkgs, lib, ... }:
let
  # nixpkgs still ships 1.0.168; pin 1.0.170 until it lands upstream
  discordBase = pkgs.discord.override {
    source = lib.importJSON ./discord-sources.json;
  };
  # 1.0.170 dropped the legacy loader that read ~/.config/discord/<ver>/modules,
  # so point the host at the bundled modules via build_info.json instead.
  discord = discordBase.override {
    unwrappedDiscord = discordBase.unwrappedDiscord.overrideAttrs (old: {
      postInstall = (old.postInstall or "") + ''
        bi=$out/opt/Discord/resources/build_info.json
        ${lib.getExe pkgs.jq} --arg root "$out/opt/Discord/modules" \
          '. + { disableUpdater: true, localModulesRoot: $root }' "$bi" > "$bi.tmp"
        mv "$bi.tmp" "$bi"
      '';
    });
  };
in
{
  home.packages = with pkgs; [
    chromium
    osu-lazer-bin
    rpi-imager
    discord
    vial
  ];
}
