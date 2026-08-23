{ ... }:
{
  # Enable Bluetooth headsets
  # https://wiki.nixos.org/wiki/Bluetooth

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;
}
