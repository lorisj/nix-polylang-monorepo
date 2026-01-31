{ pkgs, lib, ... }:
let
  shellInputs = { inherit pkgs lib; };
  base = import ./base.nix shellInputs;

  safeGetArray = attrSet: attr: if builtins.hasAttr attr attrSet then attrSet.${attr} else [ ];
  safeGetString = attrSet: attr: if builtins.hasAttr attr attrSet then attrSet.${attr} else "";

  deepUnion =
    old: new:
    old
    // new
    // {
      packages = (safeGetArray old "packages") ++ (safeGetArray new "packages");
      nativeBuildInputs =
        (safeGetArray old "nativeBuildInputs") ++ (safeGetArray new "nativeBuildInputs");
      commands = (safeGetArray old "commands") ++ (safeGetArray new "commands");
      buildInputs = (safeGetArray old "buildInputs") ++ (safeGetArray new "buildInputs");
      postShellHook = lib.concatStringsSep "\n" [
        (safeGetString old "postShellHook")
        (safeGetString new "postShellHook")
      ];
    };
  buildShellFromPath = path: pkgs.mkShell (deepUnion base (import path shellInputs));
in
{
  js = buildShellFromPath ./js.nix;
  proto = buildShellFromPath ./proto.nix;
  python = buildShellFromPath ./python.nix;
}
