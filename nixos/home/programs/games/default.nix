{ pkgs, ... }:
{
  home.packages = with pkgs; [
    prismlauncher
    temurin-bin-17
  ];
}
