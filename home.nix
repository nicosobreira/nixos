{userSettings, ...}: {
  home.username = userSettings.username;
  home.homeDirectory = "/home/" + userSettings.username;

  programs.home-manager.enable = true;

  imports = [
    ./user/code
    ./user/apps
    ./user/shell
    ./user/nil.nix
    ./user/terminal/kitty.nix
    ./user/direnv.nix
    ./user/fonts.nix
    ./user/desktop/xdg.nix
    ./user/browser/${userSettings.browser}.nix
  ];

  # Just don't change it
  home.stateVersion = "25.05";
}
