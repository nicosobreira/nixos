{ config, pkgs, userSettings, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = ("/home/" + userSettings.username);

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./user/shell/sh.nix
    ./user/shell/tui.nix
    ./user/app/terminal/${userSettings.terminal}.nix
    ./user/app/browser/${userSettings.browser}.nix
    ./user/app/nvim/nvim.nix
    ./user/app/vim/vim.nix
    ./user/app/tmux/tmux.nix
    ./user/app/code.nix
    ./user/app/keepassxc.nix
    ./user/wm/awesome/awesome.nix
  ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Development
    tree
  ];

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
      "default-web-browser" = [ "chromium.desktop" ];
      "text/html" = [ "chromium.desktop" ];
      "x-scheme-handler/http" = [ "chromium.desktop" ];
      "x-scheme-handler/https" = [ "chromium.desktop" ];
      "x-scheme-handler/about" = [ "chromium.desktop" ];
      "x-scheme-handler/unknown" = [ "chromium.desktop" ];
    };
  };

  home.sessionVariables = {
    EDITOR = userSettings.editor;
    TERM = userSettings.terminal;
    BROWSER = userSettings.browser;
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.
}
