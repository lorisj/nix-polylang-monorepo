{ pkgs, ... }:
{
  pacakges = with pkgs; [
    just
    bashInteractive
  ];

  # bashInteractive fix for
  postShellHook = ''
    export SHELL=/run/current-system/sw/bin/bash
  '';
}
