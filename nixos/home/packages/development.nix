{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Graphical Serial Monitor with Graph
    serial-studio

  ];
}
