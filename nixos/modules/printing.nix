{ pkgs, ... }:
{
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-filters
      cups-browsed
      gutenprint
    ];

    cups-pdf.enable = true;
  };

  services.ipp-usb.enable = true;

  programs.system-config-printer.enable = true;

  environment.systemPackages = with pkgs; [
    papers
  ];
}
