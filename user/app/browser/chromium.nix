{ pkgs, ... }:

{
  programs.chromium.enable = true;
  programs.chromium.extension = {
    # Ublock Origin Lite
    { id = "ddkjiahejlhfcafbddmgiahcphecmpfh" };

    # ChromeKeePass
    { id = "dphoaaiomekdhacmfoblfblmncpnbahm" };
  };

  programs.chromium.dictionaries = with pkgs; [
    hunspellDictsChromium.en_US
  ];
}
