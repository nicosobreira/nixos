{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:youwen5/zen-browser-flake";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    stylix,
    zen-browser,
    ...
  }: let
    systemSettings = {
      system = "x86_64-linux";
      hostname = "nicolas";

      timeZone = "America/Sao_Paulo";
      language = "en_US.UTF-8";
      locale = "pt_BR.UTF-8";
    };

    userSettings = {
      username = "acerola";
      email = "nicolau.sobreira@gmail.com";
      githubUsername = "nicosobreira";

      monoFont = "Caskaydia Cove Nerd Font";
      monoFontPkg = pkgs.nerd-fonts.caskaydia-cove;

      terminal = "kitty";
      editor = "nvim";
      shell = "bash";
      browser = "zen";
    };

    lib = nixpkgs.lib;

    pkgs = nixpkgs.legacyPackages.${systemSettings.system};
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

            inherit inputs;
          };
        }
      ];

      specialArgs = {
        inherit systemSettings;
        inherit userSettings;

        inherit inputs;
      };
    };

    formatter.${systemSettings.system} = nixpkgs.legacyPackages.${systemSettings.system}.alejandra;
  };
}
