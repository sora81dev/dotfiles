# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

let
  agenixSrc = builtins.fetchTarball "https://github.com/ryantm/agenix/archive/main.tar.gz";
in

{
  imports = [
     # ./hardware-configuration.nix

     # <home-manager/nixos>
      
     # for github secret Tokens (agenix)
     # "${agenixSrc}/modules/age.nix"
  ];

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

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    curl
    zsh

    # agenix module
    age
    ssh-to-age

    # agenix CLI
    inputs.agenix.packages.${pkpgs.system}.default

    # Graphical Software
    wezterm
  ];

  programs.git = {
    enable = true;
    config = {
      user = {
        name = "sora81dev";
        email = "117363029+sora81dev@users.noreply.github.com";
      };
      
      credential = {
        helper = "!f() { echo username=sora81dev; echo password=$(cat /run/agenix/github-token); }; f";
      };
    };
  };

  age.secrets.github-token = {
    file = /etc/nixos/secrets/github-token.age;
    owner = "sora81dev";
    group = "users";
    mode = "0400";
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?

}

