{ pkgs, ... }:

# TexLive | Official NixOS Wiki
# -> https://wiki.nixos.org/wiki/TexLive
let
  tex = (
    pkgs.texliveBasic.withPackages (
      ps: with ps; [
        dvisvgm
        dvipng
        wrapfig
        amsmath
        ulem
        hyperref
        capt-of
        #(setq org-latex-compiler "lualatex")
        #(setq org-preview-latex-default-process 'divisvgm)
      ]
    )
  );
in
{
  home.packages = with pkgs; [
    tex
  ];
}
