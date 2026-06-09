{
  config,
  pkgs,
  systemSettings,
  ...
}: let
  nixosFlakePath = "${config.home.homeDirectory}/nixos";
  host = systemSettings.hostname;
  user = config.home.username;
in {
  home.packages = with pkgs; [
    nil
    alejandra
  ];

  xdg.configFile."nil/config.toml".text = ''
    [language.nix]
    formatting.command = [ "alejandra" ]

    [nix]
    flake = true

    [nix.options]
    nixos.expr = '(builtins.getFlake (toString ${nixosFlakePath})).nixosConfigurations.${host}.options'
    home-manager.expr = '(builtins.getFlake (toString ${nixosFlakePath})).homeConfigurations."${user}@${host}".options'
  '';
}
