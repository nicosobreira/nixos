{ pkgs, ... }:

{
  home.packages = with pkgs; [
    tmux
  ];
  programs.tmux = {
    enable = true;

    # Config
    baseIndex = 1;
    escapeTime = 0;
    focusEvents = true;
    mouse = true;
    # newSession = true;
    terminal = "tmux-256color";

    # Keybinds
    prefix = "C-a";

    # Plugins
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
    ];

    extraConfig = ''
set -ag terminal-overrides ",$TERM:RGB"
set -g renumber-windows on

# -- Status Bar --
set -g status-position top

set -g status-position top
set -g status-justify absolute-centre
set -g status-style "fg=color8 bg=default"
set -g status-right ""
set -g status-left "[#S]"
set -g status-left-style "fg=color5"
set -g status-right-length 0
set -g status-left-length 100
setw -g window-status-current-style "fg=colour2 bg=default bold"
setw -g window-status-current-format "#I:#W "
setw -g window-status-style "fg=color8"

# Map `;` as `:`
bind -T prefix \; command-prompt

# Use prefix + r to reload .tmux.conf
unbind r
bind r source-file ~/.config/tmux/tmux.conf\; display-message "Config Reloaded"

# Use Ctrl + hjkl to move between panes
bind -n C-h select-pane -L
bind -n C-j select-pane -D
bind -n C-k select-pane -U
bind -n C-l select-pane -R

# Create window/split keep current directory
bind c new-window -c "#{pane_current_path}"
bind h split-window -v -c "#{pane_current_path}"
bind v split-window -h -c "#{pane_current_path}"

# Alt vim keys to switch windows
bind -n M-h previous-window
bind -n M-l next-window
    '';
  };
}
