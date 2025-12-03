{ userSettings, ... }:

{
  programs.git = {
    enable = true;
    userName = userSettings.githubUsername;
    userEmail = userSettings.email;
  };

  programs.gh = {
    enable = true;
  };
}
