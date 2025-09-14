{ pkgs, ... }:
{
  name = "python-grpc-server";
  packages = with pkgs; [
    python313Packages.uv
    python313Packages.venvShellHook
  ];
  venvDir = "./apps/python-grpc-server/.venv";
}
