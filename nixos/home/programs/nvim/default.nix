{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Language servers
    lua-language-server # Lua
    rust-analyzer # Rust
    nil # Nix
    tailwindcss-language-server # TailwindCSS
    typescript
    typescript-language-server # TypeScript
    vscode-css-languageserver # CSS
    tombi # TOML
    texlab # LaTeX
    yaml-language-server # YAML

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

    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];
  };

  xdg.configFile."nvim".force = true;
  xdg.configFile."nvim".source = ./../../../../nvim;

  xdg.configFile."tree-sitter".force = true;
  xdg.configFile."tree-sitter".source = ./../../../../tree-sitter;
}
