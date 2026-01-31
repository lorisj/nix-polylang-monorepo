{ pkgs, ... }:
{
  name = "proto";
  packages = with pkgs; [
    protoc-gen-es
    protobuf
    buf
  ];
}
