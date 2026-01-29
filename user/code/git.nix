{userSettings, ...}: {
  programs.git = {
    enable = true;
    settings = {
      user.name = userSettings.githubUsername;
      user.email = userSettings.email;

      init.defaultBranch = "main";
    };
  };

  programs.gh = {
    enable = true;
  };
}
