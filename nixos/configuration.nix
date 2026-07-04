# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports = [];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "hp-notebook";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Tokyo";

  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  programs.zsh.enable = true;
  users.users.sora81dev = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ];
  };

  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    zsh

    # Git
    git
    gh

    # Graphical Software
    wezterm

    gnomeExtensions.kimpanel
  ];

  programs.git = {
    enable = true;
    config = {
      user = {
        name = "sora81dev";
        email = "117363029+sora81dev@users.noreply.github.com";
      };
      
      credential.helper = "!gh auth git-credential";
    };
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Japanese Inputs
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
    ];
  };

  services.xserver.exportConfiguration = true;

  environment.variables = {
    GTK_IN_MODULE 	 = "fcitx";
    QT_IM_MODULE  	 = "fcitx";
    XMODIFIERS     	 = "@im=fcitx";
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  }

  system.stateVersion = "25.11"; # Did you read the comment?

}

