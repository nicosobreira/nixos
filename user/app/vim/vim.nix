{ pkgs, ... }:

{
  programs.vim = {
    plugins = with pkgs.vimPlugins; [
      vim-tmux-navigator
      vim-commentary
      vim-obsession
    ];
  };

  home.file.".config/vim/vimrc".source = ./vimrc;
}
