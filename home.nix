{userSettings, ...}: {
  home.username = userSettings.username;
  home.homeDirectory = "/home/" + userSettings.username;

  programs.home-manager.enable = true;

  imports = [
    ./user/code
    ./user/apps
    ./user/shell
    ./editor/nvim.nix
    ./editor/vim.nix
    ./user/nil.nix
    ./user/direnv.nix
    ./user/desktop/xdg.nix
    ./user/desktop/screen_filter.nix
    ./user/terminal/${userSettings.terminal}.nix
    ./user/browser/${userSettings.browser}.nix
    ./user/utils/nvidia-offload.nix
  ];

  home.sessionVariables = {
    EDITOR = userSettings.editor;
    TERMINAL = userSettings.terminal;
    BROWSER = userSettings.browser;

    _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=lcd -Dswing.aatext=true";
  };

  # Just don't change it
  home.stateVersion = "25.05";
}
