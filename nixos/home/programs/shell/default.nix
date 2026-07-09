{ config, pkgs, ... }:
{
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  # TODO: Load oh-my-zsh for powerlevel10k
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
    # zsh utilities(autosuggestions, syntaxHighlighting)
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel-10k.zsh-theme";
      }
    ];

    # Load zsh configuration file
    initContent = ''
      source ~/.config/.zshrc
      source ~/.config/.p10k.zsh
    '';
  };
}
