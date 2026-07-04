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

    # Rust
    cargo
    tokei

    ghq

    # Add packages for neovim
    prettier
    ripgrep
    fzf

    # NodeJS
    nodejs
    pnpm

    # Load fonts
    nerd-fonts.jetbrains-mono

    # Graphical Software
    discord
    thunderbird
    osu-lazer
    vencord
    steam
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
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
      enable  = true;
      plugins = ["git"];
    };
    # zsh utilities(autosuggestions, syntaxHighlighting)
	  autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    plugins = [
      {
        name = "powerlevel10k";
        src  = pkgs.zsh-powerlevel10k;
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
  };

}
