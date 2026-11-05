{ ... }:
{
  programs.ghostty = {
    enable = true;
    systemd.enable = true;
    enableZshIntegration = true;

    settings = {
      font-family = "JetBrainsMono Nerd Font";
      font-size = 10;

      theme = "Tomorrow";
      background = "f8f8f8";
      window-theme = "ghostty";

      keybind = [
        "ctrl+t=new_tab"
        "ctrl+j=previous_tab"
        "ctrl+k=next_tab"
        "ctrl+w=close_surface"
      ];

      gtk-tabs-location = "bottom";
      gtk-toolbar-style = "flat";
      gtk-wide-tabs = false;
      window-show-tab-bar = "always";
      window-new-tab-position = "current";
      confirm-close-surface = false;

      gtk-single-instance = false;
      shell-integration = "zsh";

      gtk-custom-css = "~/.config/ghostty/style.css";
    };
  };

  xdg.configFile."ghostty".force = true;
  xdg.configFile."ghostty".recursive = true;
  xdg.configFile."ghostty".source = ./../../../../ghostty;

  # Ghostty on native Wayland must use GTK's Wayland IM (text-input), not fcitx's
  # GTK module — otherwise fcitx5/meltype often fails to activate or commit text.
  # https://github.com/ghostty-org/ghostty/discussions/3628
  xdg.configFile."systemd/user/app-com.mitchellh.ghostty.service.d/ime.conf".text = ''
    [Service]
    Environment=GTK_IM_MODULE=wayland
  '';
}
