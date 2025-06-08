{ pkgs, ... }:

{
  programs.chromium.enable = true;
  programs.chromium.extensions = [
    # Ublock Origin Lite
    { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; }

    # ChromeKeePass
    { id = "dphoaaiomekdhacmfoblfblmncpnbahm"; }
  ];

  programs.chromium.dictionaries = with pkgs; [
    hunspellDictsChromium.en_US
  ];
}
