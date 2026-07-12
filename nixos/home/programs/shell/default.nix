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
    initExtra = ''
      source ~/.zshrc_custom
    '';
  };

  home.file = {
    ".zshrc_custom".source = ./../../../../.zshrc;
  };
}
