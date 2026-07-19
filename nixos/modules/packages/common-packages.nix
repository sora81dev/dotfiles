{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    zsh
    unzip
    efibootmgr

    # Graphical Software
    wezterm

    gnomeExtensions.kimpanel

    # Hyprland
    mako
    hyprshot
    ffmpeg
    wf-recorder
  ];

  programs.zsh.enable = true;
}
