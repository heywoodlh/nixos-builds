{ config, pkgs, ... }:

{
  imports = [
    ./heywoodlh.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "20.09";
}
