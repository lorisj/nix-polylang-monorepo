{ pkgs, ... }:
{
  name = "js";
  buildInputs = with pkgs; [
    nodejs
    npkill   # removes node_modules directories
    nodePackages.pnpm
    nodePackages.typescript
    nodePackages.typescript-language-server
    grpc-tools # protoc and grpc w/node
    buf
  ];
}
