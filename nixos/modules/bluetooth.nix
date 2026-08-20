{ ... }:
{
  # Enable Bluetooth headsets
  # https://wiki.nixos.org/wiki/Bluetooth
  services.pipewire.enable = false;
  services.pulseaudio.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };

  services.blueman.enable = true;
}
