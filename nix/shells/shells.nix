{ pkgs, lib, ... }:
let
  base = import ./base.nix { inherit pkgs lib; };
  safeGetArray = attrSet: attr: (if (attrSet ? ${attr}) then attrSet.${attr} else [ ]);
  safeGetString = attrSet: attr: (if (attrSet ? ${attr}) then attrSet.${attr} else "");
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
      shellHook = lib.concatStringsSep "\n" [
        (safeGetString old "shellHook")
        (safeGetString new "shellHook")
      ];
    };
  shellInputs = { inherit pkgs lib; };
  buildShellFromPath = path: pkgs.mkShell (deepUnion base (import path shellInputs));
in
{
  js = buildShellFromPath ./js.nix;
}
