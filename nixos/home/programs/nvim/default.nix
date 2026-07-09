{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    withPython3 = true;

    extraPackages = with pkgs; [
      # Plugin build dependencies
      cmake
      gcc
      tree-sitter
      prettier
      ripgrep
      fzf

      # Language servers
      lua-language-server # Lua
      rust-analyzer # Rust
      nil # Nix
    ];
  };

  home.file = {
    ".config/nvim".source = ./../../../../neovim;
  };
}
