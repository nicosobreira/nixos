{pkgs, ...}: let
  zen-browser = import (builtins.fetchTarball "https://github.com/youwen5/zen-browser-flake/archive/master.tar.gz") {
    inherit pkgs;
  };
in {
  home.packages = [
    zen-browser
  ];
}
