{
  config,
  pkgs,
  userSettings,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = "/home/" + userSettings.username;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./user/code/shell/tools.nix
    ./user/code/terminal/${userSettings.terminal}.nix
    ./user/browser/${userSettings.browser}.nix
    ./user/code/editor/nvim.nix
    ./user/code/editor/vim.nix
    ./user/code/tmux/tmux.nix
    ./user/code/git.nix
    ./user/code/languages.nix
    ./user/code/lsp.nix
    ./user/code/direnv.nix
    ./user/apps.nix
    ./user/todo-app.nix

    ./user/lutris.nix
    # ./user/mario64.nix
  ];

  home.sessionVariables = {
    EDITOR = userSettings.editor;
    TERMINAL = userSettings.terminal;
    BROWSER = userSettings.browser;
  };

  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    music = null;
    templates = null;
    desktop = null;
    publicShare = null;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "default-web-browser" = [(userSettings.browser + ".desktop")];
      "text/html" = [(userSettings.browser + ".desktop")];
      "x-scheme-handler/http" = [(userSettings.browser + ".desktop")];
      "x-scheme-handler/https" = [(userSettings.browser + ".desktop")];
      "x-scheme-handler/about" = [(userSettings.browser + ".desktop")];
      "x-scheme-handler/unknown" = [(userSettings.browser + ".desktop")];
    };
  };

  # Just don't change it
  home.stateVersion = "25.05";
}
