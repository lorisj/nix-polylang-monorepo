{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs:
    inputs.flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = (import (inputs.nixpkgs) { inherit system; });
        lib = pkgs.lib;
        shellInputs = { inherit pkgs lib; };
      in
      {
        devShells = import ./nix/shells/shells.nix shellInputs;
      }
    );
}
