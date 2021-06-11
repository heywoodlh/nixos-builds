{ config, pkgs, ... }:

{
  imports = [
    ./system-defaults.nix
    ./modules/security/pam.nix
    ./network.nix
    ./wm.nix
    ./mac-config.nix
    ./packages.nix
    ./users.nix
  ];
  
  #Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  nix.extraOptions = {
    extra-platforms = x86_64-darwin aarch64-darwin;
  };

  pkgsM1 = import <nixpkgs> { 
    localSystem = "aarch64-darwin"; 
  };
  nix.pkg = pkgsM1.nix;

  system.stateVersion = 4;
}
