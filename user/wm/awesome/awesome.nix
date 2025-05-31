{ pkgs, ... }

{
  services.xserver = {
    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks # is the package manager for Lua modules
      ];
    };
  };

  home.file.".config/awesome".source = ./rc.lua;
}
