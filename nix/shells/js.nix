{ pkgs, ... }:
{
  name = "js";
  packages = with pkgs; [
    nodejs
    npkill # removes node_modules directories
    nodePackages.pnpm
    nodePackages.typescript
    nodePackages.typescript-language-server
  ];
}
