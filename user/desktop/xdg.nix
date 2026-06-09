{userSettings, ...}: {
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
}
