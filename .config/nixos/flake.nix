{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Only this small directory becomes a Nix input.
    home-config = {
      url = "path:/home/lynk/.config/home-manager";
      flake = false;
    };

    noctalia.url = "github:noctalia-dev/noctalia/cachix";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      noctalia,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs;
        };

        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;

            home-manager.users.lynk =
              import (inputs.home-config + "/home.nix");
          }

          noctalia.nixosModules.default
        ];
      };

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [];
      };
    };
}
