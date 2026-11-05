{ ... }:
{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];

        settings = {
          main = {
            capslock = "layer(control)";
          };
          otherlayer = { };
        };
      };
    };
  };

  # IME env vars are configured by Home Manager (i18n.inputMethod / fcitx5).
  # Do not set GTK_IM_MODULE globally on Wayland — it breaks Ghostty + fcitx5.
}
