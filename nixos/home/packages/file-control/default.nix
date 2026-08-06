{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # check filetype
    file

    # convert file encoding
    nkf

    # check usb device
    usbutils
  ];
}
