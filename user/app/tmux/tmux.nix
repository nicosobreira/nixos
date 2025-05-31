{ pkgs, ... }:

{
  home.packges = with pkgs; [
    tmux
  ];
  home.file.".config/tmux".source = ./.;
}
