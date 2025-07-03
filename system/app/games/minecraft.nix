{ pkgs, inputs, ... }:

{
  nixpkgs.overlays = [ inputs.polymc.overlay ];

  environment.systemPackages = with pkgs; [
    polymc
    zulu24
    openjdk17-bootstrap
    jre17_minimal
  ];
}
