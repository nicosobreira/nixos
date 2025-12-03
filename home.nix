{
  config,
  pkgs,
  userSettings,
  ...
}:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = ("/home/" + userSettings.username);

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./user/shell/tools.nix
    ./user/app/terminal/${userSettings.terminal}.nix
    ./user/app/browser/${userSettings.browser}.nix
    ./user/app/editor/nvim.nix
    ./user/app/editor/vim.nix
    ./user/app/tmux/tmux.nix
    ./user/app/git.nix
    ./user/code.nix
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
    music = "${config.home.homeDirectory}/Music";
    videos = "${config.home.homeDirectory}/Videos";
    pictures = "${config.home.homeDirectory}/Pictures";
    templates = "${config.home.homeDirectory}/Templates";
    download = "${config.home.homeDirectory}/Downloads";
    documents = "${config.home.homeDirectory}/Documents";
    desktop = null;
    publicShare = null;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "default-web-browser" = [ (userSettings.browser + ".desktop") ];
      "text/html" = [ (userSettings.browser + ".desktop") ];
      "x-scheme-handler/http" = [ (userSettings.browser + ".desktop") ];
      "x-scheme-handler/https" = [ (userSettings.browser + ".desktop") ];
      "x-scheme-handler/about" = [ (userSettings.browser + ".desktop") ];
      "x-scheme-handler/unknown" = [ (userSettings.browser + ".desktop") ];
    };
  };

  # Just don't change it
  home.stateVersion = "25.05";
}
