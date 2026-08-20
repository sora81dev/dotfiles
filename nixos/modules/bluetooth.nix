{ ... }:
{
  # Enable Bluetooth headsets
  # https://wiki.nixos.org/wiki/Bluetooth
  services.pipewire.enable = false;
  services.pulseaudio.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  services.blueman.enable = true;
}
