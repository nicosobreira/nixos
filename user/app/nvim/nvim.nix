{ pkgs-stable, ... }:

{
  programs.neovim.enable = true;
  programs.neovim.extraPackages = with pkgs-stable; [
    nodejs # For nmp
    tree-sitter # Binary
    ripgrep # For telescope

    # LSP, formatters, etc.
    stylua
    zls
    rocmPackages.llvm.rocm-merged-llvm # Clangd
    nil # Nix
    stylua
  ];

  home.file.".config/nvim".source = ./.;
  home.file.".config/nvim".recursive = true;
}
