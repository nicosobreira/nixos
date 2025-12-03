{ userSettings, ... }:

{
  # home.packages = with pkgs; [
  #   gh
  #
  #   lua
  #
  #   gnumake
  #   cmake
  #   gcc_multi
  #   gdb
  #
  #   # clang
  #   clang-tools
  #   # llvmPackages.libcxxClang
  #
  #   zig
  # ];

  programs.gh.enable = true;

  programs.git = {
    enable = true;
    user.name = userSettings.githubUsername;
    user.email = userSettings.email;
  };
}
