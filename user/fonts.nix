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

  fonts.fontconfig.enable = true;
  xdg.configFile."fontconfig/conf.d/99-terminess-custom.conf".text = ''
    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
    <fontconfig>

      <match target="font">
        <test name="family" qual="any" compare="contains">
          <string>Terminess</string>
        </test>
        <edit name="antialias" mode="assign">
          <bool>false</bool>
        </edit>
      </match>

      <match target="pattern">
        <test name="family" qual="any" compare="contains">
          <string>Terminess</string>
        </test>
        <test name="slant" compare="not_eq">
          <int>0</int>
        </test>
        <edit name="slant" mode="assign">
          <int>0</int>
        </edit>
      </match>

    </fontconfig>
  '';
}
