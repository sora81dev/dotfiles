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
    waybar
    hyprpaper
    mako
    hyprshot
    wl-clipboard
    ffmpeg
    wf-recorder
    brightnessctl
    rofimoji
    wl-clipboard
    wlogout

    pulseaudio
  ];

  programs.zsh.enable = true;
}
