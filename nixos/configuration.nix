# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  pkgs,
  options,
  ...
}:

{
  imports = [
    ./modules/programs

    ./modules/desktop-configuration.nix
    ./modules/fonts.nix
    ./modules/keyboard.nix
  ];

  # boot.loader.systemd-boot.enable = true;

  boot.loader = {
    systemd-boot.enable = false;

    efi = {
      canTouchEfiVariables = true;
    };

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
    };
  };

  networking.hostName = "hp-notebook";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Tokyo";
  networking.timeServers = options.networking.timeServers.default ++ [ "ntp.nict.jp" ];

  programs.zsh.enable = true;

  users.users.sora81dev = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "input"
    ];
  };

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
    wofi
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

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  services.pipewire.enable = true;
  services.pipewire.pulse.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.xserver.exportConfiguration = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  system.stateVersion = "25.11"; # Did you read the comment?

}
