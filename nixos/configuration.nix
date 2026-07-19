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
    ./modules/packages
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

  # programs.hyprland = {
  #   enable = true;
  #   withUWSM = true;
  #   xwayland.enable = true;
  # };

  services.pipewire.enable = true;
  services.pipewire.pulse.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.xserver.exportConfiguration = true;

  system.stateVersion = "25.11"; # Did you read the comment?
}
