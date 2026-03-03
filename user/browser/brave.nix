{pkgs, ...}: {
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      {id = "eimadpbcbfnmbkopoojfekhnkhdbieeh";} # Dark Reader
      {id = "ejkiikneibegknkgimmihdpcbcedgmpo";} # Volume Booster
      {id = "khncfooichmfjbepaaaebmommgaepoid";} # Unhook
      {id = "lloccabjgblebdmncjndmiibianflabo";} # Reading List
    ];
  };
}
