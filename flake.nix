{
  description = "My first flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-unstable";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      inherit system;
      nicolas = lib.nixosSystem {
        modules = [ ./configuration.nix ];
      };
    };
    homeConfigurations = {
      acerola = home-manager.lib.homeManagerConfigurations {
        inherit pkgs;
        modules = [ ./home.nix ];
      };
    };
  };
}
