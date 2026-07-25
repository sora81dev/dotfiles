{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.dolphin
  ];

  xdg.configFile."dolphinrc".force = true;
  xdg.configFile."dolphinrc".source = ./../../../../dolphinrc;
}
