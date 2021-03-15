{ config, pkgs, ... }:

{
  imports = [
    ./system-defaults.nix
    ./network.nix
    ./wm.nix
    ./mac-config.nix
    ./packages.nix
    ./users.nix
  ];
  
  #Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  system.stateVersion = 4;
}
