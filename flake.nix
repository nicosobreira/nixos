{
  description = "My first flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    systemSettings = {
      system = "x86_64-linux";
      hostname = "nicolas";
      timeZone = "America/Sao_Paulo";
      language = "en_US.UTF-8";
      locale = "pt_BR.UTF-8";
      bootMode = "uefi";
      bootMoundPath = "/boot";
      grupDevide = "";
      gpuType = "nvidia";
    };

    userSettings = {
      username = "acerola";
      email = "nicolau.sobreira@gmail.com";

      font = "CaskaydiaCove Nerd Font";
      fontPkg = pkgs.nerd-fonts.caskaydia-cove;

      terminal = "alacritty";  # Stored in: ./user/app/terminal
      editor = "nvim";  # Stored in: ./user/app/editor
      shell = "fish";  # Still not automatically
    };

    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${systemSettings.system};
  in {
    nixosConfigurations.${systemSettings.hostname} = lib.nixosSystem {
      system = systemSettings.system;
      modules = [ ./configuration.nix ];
      specialArgs = {
        inherit systemSettings;
        inherit userSettings;
      };
    };

    homeConfigurations.${userSettings.username} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [ ./home.nix ];
      extraSpecialArgs = {
        inherit systemSettings;
        inherit userSettings;
      };
    };
  };
}
