{ ... }:
{
  imports = [
    ./packages

    ./programs/dolphin
    ./programs/git
    ./programs/nvim
    ./programs/zsh
  ];

  nixpkgs.config.allowUnfree = true;

  xdg.configFile."wezterm".force = true;
  xdg.configFile."wezterm".source = ./../../wezterm;
}
