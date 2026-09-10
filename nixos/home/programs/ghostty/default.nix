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

      gtk-single-instance = false;
      shell-integration = "zsh";

      gtk-custom-css = "~/.config/ghostty/style.css";
    };
  };

  xdg.configFile."ghostty".force = true;
  xdg.configFile."ghostty".recursive = true;
  xdg.configFile."ghostty".source = ./../../../../ghostty;
}
