{ pkgs, ... }:
{
  name = "js";
  buildInputs = with pkgs; [
    nodejs
    nodePackages.pnpm
    nodePackages.typescript
    nodePackages.typescript-language-server
  ];
}
