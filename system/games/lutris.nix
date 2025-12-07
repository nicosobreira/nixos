{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (lutris.override {
      extraPkgs = pkgs: [
        antimicrox
      ];
    })
  ];
}
