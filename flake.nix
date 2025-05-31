{
  description = "My first flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    username = "acerola";
    system = "x86_64-linux";

    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      nicolas = lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
      };
    };
    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        defaultPackage.${system} = home-manager.defaultPackage.${system};
        modules = [ ./home.nix ];
      };
    };
  };
}
