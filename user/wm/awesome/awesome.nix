{ pkgs, services,  ... }:

{
  home.file.".config/awesome".source = ./.;
  home.file.".config/nvim".recursive = true;
}
