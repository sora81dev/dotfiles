{ ... }:
{
  imports = [
    ./packages

    ./programs/dolphin
    ./programs/git
    ./programs/nvim
    ./programs/zsh
  ];

  xdg.configFile."wezterm".force = true;
  xdg.configFile."wezterm".source = ./../../wezterm;
}
