{userSettings, ...}: {
  home.username = userSettings.username;
  home.homeDirectory = "/home/" + userSettings.username;

  programs.home-manager.enable = true;

  imports = [
    ./user/code
    ./user/apps
    ./user/shell
    ./user/nil.nix
    ./user/direnv.nix
    ./user/desktop/xdg.nix
    ./user/terminal/${userSettings.terminal}.nix
    ./user/browser/${userSettings.browser}.nix
  ];

  # Just don't change it
  home.stateVersion = "25.05";
}
