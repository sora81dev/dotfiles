{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Language servers
    lua-language-server # Lua
    rust-analyzer # Rust
    nil # Nix
    typescript
    typescript-language-server # TypeScript
    vscode-css-languageserver # CSS

    # Plugin build dependencies
    cmake
    gcc
    tree-sitter
    prettier
    ripgrep
    fzf
  ];

  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    withPython3 = true;
  };

  home.file = {
    ".config/nvim".source = ./../../../../neovim;
  };
}
