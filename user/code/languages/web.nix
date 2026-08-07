{pkgs, ...}: {
  home.packages = with pkgs; [
    nodejs

    # Lsp
    vscode-langservers-extracted # html, css, json, eslint
    typescript-language-server
    typescript
    emmet-language-server # precisa do nodejs no PATH pra rodar

    # Formatter
    prettier
  ];
}
