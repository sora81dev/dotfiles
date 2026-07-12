{ pkgs, ... }:
{
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };

    # zsh utilities
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    plugins = [
    ];

    # Load zsh configuration file
    initContent = ''
      source ~/.zshrc
    '';
  };

  home.file = {
    ".zshrc".source = ./../../../../.zshrc;
  };
}
