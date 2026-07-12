{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pure-prompt
  ];

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;

    # zsh utilities
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    plugins = [
    ];

    # Load zsh configuration file
    initExtra = ''
      # Load original configuration
      source ~/.zshrc_custom

      # Enable Pure prompt
      fpath+=( "${pkgs.pure-prompt}/share/zsh/site-functions" )
      autoload -U promptinit; promptinit
      prompt pure
    '';
  };

  home.file = {
    ".zshrc_custom".source = ./../../../../.zshrc;
  };
}
