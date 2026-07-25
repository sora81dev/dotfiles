{ pkgs, ... }:
{
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;

    # zsh utilities
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # Load zsh configuration file
    initContent = ''
      source ~/.zshrc
    '';
  };

  programs.eza = {
    enable = true;
    # enableZshIntegration = true;

    colors = "always";
    git = true;
    icons = "always";

    extraOptions = [
      "--group-directories-first"
      "--time-style=relative"
    ];
  };

  home.file.".zshrc".source = ./../../../../.zshrc;

  xdg.configFile."commands".force = true;
  xdg.configFile."commands".source = ./../../../../commands;

  xdg.configFile."starship.toml".force = true;
  xdg.configFile."starship.toml".source = ./../../../../starship.toml;
}
