{ userSettings, ... }:

{
  programs.git = {
    enable = true;
    userName = userSettings.githubUsername;
    userEmail = userSettings.email;
  };

  programs.gh = {
    enable = true;
    settings.github.oauth_token = builtins.readFile ("/home/" + userSettings.username + "/.config/gh/token");
  };
}
