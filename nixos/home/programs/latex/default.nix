{ pkgs, ... }:

# TexLive | Official NixOS Wiki
# -> https://wiki.nixos.org/wiki/TexLive
let
  tex = (
    pkgs.texliveBasic.withPackages (
      ps: with ps; [
        pxrubrica
        luatexja
        xkeyval
        haranoaji
        enumitem
        #(setq org-latex-compiler "lualatex")
        #(setq org-preview-latex-default-process 'divisvgm)
      ]
    )
  );
in
{
  home.packages = [
    tex
  ];
}
