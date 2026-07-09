{ config, pkgs, ... }:

{
  home.username = "sora81dev";
  home.homeDirectory = "/home/sora81dev";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05";

  nixpkgs.config.allowUnfree = true;

  # Packages
  home.packages = with pkgs; [
    tree
    
    gcc
    clang-tools

    # Rust
    rustc
    cargo
    tokei

    ghq

    lazygit

    # Neovim Plugins
    tree-sitter
    prettier
    ripgrep
    fzf

    # Neovim LSP
    lua-language-server # Lua
    rust-analyzer # Rust
    nil # Nix

    # NodeJS
    nodejs
    pnpm

    # Load fonts
    nerd-fonts.jetbrains-mono

    # Graphical Software
    discord
    thunderbird
    osu-lazer-bin
    vencord
    steam
  ];

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  news.display = "silent";

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

  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    withPython3 = true;
  };

  xdg.configFile."nvim" = {
    source = ./../neovim;
    recursive = true;
  };

}
