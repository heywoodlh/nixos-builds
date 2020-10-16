{ config, pkgs, ... }:

{
  imports = [
    ./homebrew.nix
    ./system-defaults.nix
    ./network.nix
    ./wm.nix
    ./config.nix
  ];

  #Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  system.stateVersion = 4;
}
