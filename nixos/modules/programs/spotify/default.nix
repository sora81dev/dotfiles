{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    spotify
  ];

  services.spotifyd.enable = true;
}
