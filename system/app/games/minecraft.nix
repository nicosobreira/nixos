{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (lunar-client.override {
      gamemodeSupport = true;
    })
  ];
}
