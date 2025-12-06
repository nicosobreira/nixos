{ userSettings, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = userSettings.githubUsername;
      user.email = userSettings.email;
    };
  };

  programs.gh = {
    enable = true;
  };
}
