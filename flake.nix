{
  description = "My first flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-25.05";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, nixpkgs-stable, home-manager, ... }:
  let
    systemSettings = {
      system = "x86_64-linux";
      hostname = "nicolas";

      timeZone = "America/Sao_Paulo";
      language = "en_US.UTF-8";
      locale = "pt_BR.UTF-8";

      gpuType = "nvidia";
    };

    userSettings = {
      username = "acerola";
      email = "nicolau.sobreira@gmail.com";

      font = "CaskaydiaCove Nerd Font";
      fontPkg = pkgs.nerd-fonts.caskaydia-cove;

      terminal = "alacritty";  # Stored in: ./user/app/terminal
      editor = "nvim";  # Stored in: ./user/app/editor
      shell = "fish";  # Stored in: ./user/shell/sh.nix
      browser = "vivaldi";  # Stored in: ./user/app/browser
      wm = "awesome";
    };

    lib = nixpkgs.lib;

    pkgs = nixpkgs.legacyPackages.${systemSettings.system};
    pkgs-stable = nixpkgs-stable.legacyPackages.${systemSettings.system};
  in {
    nixosConfigurations.${systemSettings.hostname} = lib.nixosSystem {
      system = systemSettings.system;
      modules = [ ./configuration.nix ];
      specialArgs = {
        inherit systemSettings;
        inherit userSettings;

        inherit pkgs-stable;
      };
    };

    homeConfigurations.${userSettings.username} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [ ./home.nix ];
      extraSpecialArgs = {
        inherit systemSettings;
        inherit userSettings;

        inherit pkgs-stable;
      };
    };
  };
}
