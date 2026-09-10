{ ... }:
{
  programs.ghostty = {
    enable = true;
    systemd.enable = true;
    enableZshIntegration = true;

    settings = {
      font-family = "JetBrainsMono Nerd Font";
      font-size = 10;
    };
  };
}
