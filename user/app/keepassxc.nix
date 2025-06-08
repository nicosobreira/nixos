{ ... }:

{
  programs.keepassxc.enable = true;
  programs.keepassxc.settings = {
    Browser.Enabled = true;

    GUI = {
      AdvancedSettings = true;
      ApplicationTheme = "dark";
      CompactMode = true;
      HidePasswords = true;
    };

    # SSHAgent.Enabled = true;
  };
}
