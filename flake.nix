{
  description = "My first flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    stylix,
    ...
  } @ inputs: let
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
      githubUsername = "nicosobreira";

      font = "Caskaydia Cove Nerd Font";
      fontPkg = pkgs.nerd-fonts.caskaydia-cove;

      terminal = "kitty"; # Stored in: ./user/app/terminal
      editor = "nvim"; # Stored in: ./user/app/editor
      shell = "bash"; # Stored in: ./user/shell/sh.nix
      browser = "brave"; # Stored in: ./user/app/browser
    };

    lib = nixpkgs.lib;

    pkgs = nixpkgs.legacyPackages.${systemSettings.system};
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${systemSettings.system};
  in {
    nixosConfigurations.${systemSettings.hostname} = lib.nixosSystem {
      system = systemSettings.system;
      modules = [
        ./configuration.nix
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${userSettings.username} = ./home.nix;

          home-manager.extraSpecialArgs = {
            inherit systemSettings;
            inherit userSettings;

            inherit pkgs-unstable;
            inherit inputs;
          };
        }
      ];

      specialArgs = {
        inherit systemSettings;
        inherit userSettings;

        inherit pkgs-unstable;
        inherit inputs;
      };
    };

    formatter.${systemSettings.system} = nixpkgs.legacyPackages.${systemSettings.system}.alejandra;
  };
}
