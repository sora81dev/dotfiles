{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Breadboard Editor
    fritzing

    # CAN Analyzer
    savvycan
  ];
}
