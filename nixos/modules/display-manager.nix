{ pkgs, inputs, ... }:
let
  sddm-astronaut =
    (pkgs.sddm-astronaut.override {
      embeddedTheme = "hyprland_kath";
      themeConfig = {
        DateTextColor = "#ededed";
        TimeTextColor = "#ededed";

        LoginFieldBackgroundColor = "#ededed";
        PasswordFieldBackgroundColor = "#ededed";
        LoginFieldTextColor = "#ededed";
        PasswordFieldTextColor = "#ededed";
        UserIconColor = "#ededed";
        PasswordIconColor = "#ededed";

        LoginButtonTextColor = "#ffffff";
        LoginButtonBackgroundColor = "#ededed";
        SessionButtonTextColor = "#ededed";
        VirtualKeyboardButtonTextColor = "#ededed";

        HighlightTextColor = "#ffffff";

        Background = "Backgrounds/chokagu.png";
      };
    }).overrideAttrs
      (oldAttrs: {
        installPhase = oldAttrs.installPhase + ''
          chmod u+w $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/
          cp ${inputs.wallpapers}/chokagu.png \
            $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/chokagu.png
        '';
      });
in
{
  services.displayManager.sddm = {
    enable = true;
    theme = "sddm-astronaut-theme";
    package = pkgs.kdePackages.sddm;
    extraPackages = with pkgs.kdePackages; [
      qtsvg
      qtvirtualkeyboard
      qtmultimedia
    ];
  };

  environment.systemPackages = [
    sddm-astronaut
  ];
}
