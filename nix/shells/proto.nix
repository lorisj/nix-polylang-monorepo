{ pkgs, ... }:
{
  name = "proto";
  buildInputs = with pkgs; [
    protoc-gen-es
    protobuf
    buf
  ];
}
