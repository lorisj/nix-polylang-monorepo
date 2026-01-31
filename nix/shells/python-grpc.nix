{ pkgs, ... }:
let
  libs = [
    pkgs.stdenv.cc.cc.lib
  ];
in
{
  name = "python-grpc-server";
  env = {
    LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath libs;
  };
  packages = with pkgs; [
    python313Packages.uv
    python313Packages.venvShellHook
  ];
  venvDir = "./apps/python-grpc-server/.venv";
}
