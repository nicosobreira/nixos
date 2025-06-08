{ pkgs, ... }:

{
  programs.chromium.enable = true;
  programs.chromium.extensions = [
    # Ublock Origin Lite
    { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; }

    # KeePassXC-Browser
    { id = "oboonakemofpalcgghocfoadofidjkkk"; }

    # Enhancer for Youtube
    { id = "ponfpcnoihfmfllpaingbgckeeldkhle"; }
  ];
}
