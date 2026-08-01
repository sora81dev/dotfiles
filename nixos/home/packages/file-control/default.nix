{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # check filetype
    file

    # convert file encoding
    nkf
  ];
}
