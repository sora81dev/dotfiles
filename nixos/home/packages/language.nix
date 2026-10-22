{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Go
    go
  ];
}
