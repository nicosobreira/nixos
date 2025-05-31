{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    nodejs
  ];
  home.file.".config/nvim".source = ./.;
  home.file.".config/nvim".recursive = true;
}
