{pkgs, ...}: {
  home.packages = with pkgs; [
    (texlive.combine {
      inherit
        (texlive)
        scheme-medium # base + a maioria dos pacotes comuns de matemática
        collection-latexextra
        collection-fontsrecommended
        latexmk
        ; # automatiza múltiplas compilações (refs, bib, etc)
    })
    texlab # language server (autocompletar, diagnóstico)
    zathura # visualizador de PDF, integra com SyncTeX
  ];
}
