{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    };
    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };
    darwin = { 
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
    };
  };

  outputs = inputs@{ self, darwin, nixpkgs, nixpkgs-unstable, home-manager }:
  let
    pkgs-unstable = import nixpkgs-unstable {
      system = "aarch64-darwin";
    };
  in
  {
    darwinConfigurations."Linhs-MacBook-Pro" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ ./configuration.nix ];
      specialArgs = { inherit pkgs-unstable; };
      inputs = { inherit nixpkgs darwin home-manager; };
    };
  };
}
