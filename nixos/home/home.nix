{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./programs
    ./packages
  ];

  _module.args = { inherit inputs; };

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
    direnv
    platformio

    gcc
    clang-tools

    # Rust
    rustc
    cargo
    tokei

    ghq

    lazygit

    # NodeJS
    nodejs
    pnpm

  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  news.display = "silent";
}
