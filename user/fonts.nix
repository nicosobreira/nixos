{...}: {
  xresources.properties = {
    "Xft.antialias" = 1;
    "Xft.hinting" = 1;
    "Xft.hintstyle" = "hintslight";
    "Xft.rgba" = "rgb";
    "Xft.lcdfilter" = "lcddefault";
  };

  home.sessionVariables = {
    _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=lcd -Dswing.aatext=true";
  };
}
