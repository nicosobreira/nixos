{userSettings, ...}: {
  home.sessionVariables = {
    EDITOR = userSettings.editor;
    TERMINAL = userSettings.terminal;
    BROWSER = userSettings.browser;
  };
}
