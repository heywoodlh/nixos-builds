{ config, pkgs, ... }:

{
  imports = [
    ./home-config.nix
    ./wm.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "21.03";
}
