{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # view and configure network settings
    iw

    # view network traffic with graph
    nload
  ];
}
