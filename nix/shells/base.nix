{ pkgs, ... }:
{
  buildInputs = with pkgs; [ 
    just
    bashInteractive
  ];
}
