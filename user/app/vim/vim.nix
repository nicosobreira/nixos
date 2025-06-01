{ pkgs, ... }:

{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-tmux-navigator
      vim-commentary
      vim-obsession
    ];
  };
  home.file.".vimrc".source = ./vimrc;
}
