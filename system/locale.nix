{systemSettings, ...}: {
  time.timeZone = systemSettings.timeZone;

  i18n.defaultLocale = systemSettings.language;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = systemSettings.locale;
    LC_IDENTIFICATION = systemSettings.locale;
    LC_MEASUREMENT = systemSettings.locale;
    LC_MONETARY = systemSettings.locale;
    LC_NAME = systemSettings.locale;
    LC_NUMERIC = systemSettings.locale;
    LC_PAPER = systemSettings.locale;
    LC_TELEPHONE = systemSettings.locale;
    LC_TIME = systemSettings.locale;
  };

  services.xserver = {
    autoRepeatDelay = 200;
    autoRepeatInterval = 50;

    xkb = {
      layout = "br";
      variant = "abnt2";
      options = "caps:escape";
    };
  };

  services.libinput = {
    enable = true;
    touchpad.disableWhileTyping = true;
  };

  console.useXkbConfig = true;
}
