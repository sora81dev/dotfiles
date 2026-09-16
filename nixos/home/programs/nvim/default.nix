{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Language servers
    astro-language-server # Astro
    lua-language-server # Lua
    rust-analyzer # Rust
    nil # Nix
    tailwindcss-language-server # TailwindCSS
    typescript
    typescript-language-server # TypeScript
    tombi # TOML
    texlab # LaTeX
    vscode-langservers-extracted # HTML, CSS, JSON
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

    sideloadInitLua = true;

    initLua = ''
      vim.lsp.config('astro', {
        init_options = {
          typescript = {
            tsdk = "${pkgs.typescript}/lib/node_modules/typescript/lib",
          },
        },
      })
      vim.lsp.enable('astro')
    '';
  };

  xdg.configFile."nvim".force = true;
  xdg.configFile."nvim".source = ./../../../../nvim;

  xdg.configFile."tree-sitter".force = true;
  xdg.configFile."tree-sitter".source = ./../../../../tree-sitter;
}
