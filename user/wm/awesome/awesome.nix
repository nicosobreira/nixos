{ ... }:

{
  xsession.windowManager.awesome.enable = true;
  home.file.".config/awesome".source = ./.;
  home.file.".config/awesome".recursive = true;
}
