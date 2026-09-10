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
    };
  };
}
