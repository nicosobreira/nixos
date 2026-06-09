{
  pkgs,
  userSettings,
  ...
}: let
  shellPkg =
    {
      "bash" = pkgs.bash;
      "fish" = pkgs.fish;
      "zsh" = pkgs.zsh;
    }.${
      userSettings.shell
    };
in {
  environment.shells = [shellPkg];
  users.defaultUserShell = shellPkg;
  programs.${userSettings.shell}.enable = true;
}
