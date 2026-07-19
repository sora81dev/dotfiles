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
      source ~/.zshrc_custom
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

  home.file = {
    ".zshrc_custom".source = ./../../../../.zshrc;
  };
}
